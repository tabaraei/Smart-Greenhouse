from pprint import pprint
import requests
import json
from time import sleep
from api import *

token = '1041264609:AAEXuaWYRvy1mTLx5AbsDH0jPz2ZBFdQ68E'
url = 'https://api.telegram.org/bot{}/'.format(token)


def get_updates(offset=None):

    while True:
        try:
            URL = url + 'getUpdates'
            if offset:
                URL += '?offset={}'.format(offset)

            res = requests.get(URL)
            while (res.status_code != 200 or len(res.json()['result']) == 0):
                sleep(1)
                res = requests.get(URL)
            print(res.url)
            return res.json()

        except:
            pass


def get_last(data):

    results = data['result']
    count = len(results)
    last = count - 1
    last_update = results[last]
    return last_update


def get_last_id_text(updates):
    last_update = get_last(updates)
    chat_id = last_update['message']['chat']['id']
    update_id = last_update['update_id']
    try:
        text = last_update['message']['text']
    except:
        text = ''
    return chat_id, text, update_id


def send_message(chat_id, text, reply_markup=None):
    URL = url + \
        "sendMessage?text={}&chat_id={}&parse_mode=Markdown".format(
            text, chat_id)
    if reply_markup:
        URL += '&reply_markup={}'.format(reply_markup)
    res = requests.get(URL)
    while res.status_code != 200:
        res = requests.get(URL)
    print(res.status_code)


def reply_markup_maker(data):
    keyboard = []
    for i in range(0, len(data), 2):
        key = []
        key.append(data[i].title())
        try:
            key.append(data[i+1].title())
        except:
            pass
        keyboard.append(key)

    reply_markup = {"keyboard": keyboard, "one_time_keyboard": True}
    return json.dumps(reply_markup)


def b1(chat_id, update_id):
    message = lastRecord()
    send_message(chat_id, message)


def b2(chat_id, update_id):
    message = last10Records()
    send_message(chat_id, message)


def b3(chat_id, update_id):
    message = startIrrigate()
    send_message(chat_id, message)


def b4(chat_id, update_id):
    message = stopIrrigate()
    send_message(chat_id, message)


def start(chat_id):
    reply_markup = reply_markup_maker(['Start'])
    chat_id, text, update_id = get_last_id_text(get_updates())
    while(text.lower() != '/start'):
        chat_id, text, update_id = get_last_id_text(get_updates(update_id+1))
        sleep(0.5)

    return chat_id, text, update_id


def welcome_note(chat_id, commands):
    text = 'How can I help you?'
    reply_markup = reply_markup_maker(commands)
    send_message(chat_id, text, reply_markup)


def menu(chat_id, text, update_id):
    c1 = 'get last record'
    c2 = 'get last 10 records'
    c3 = 'start manual irrigation'
    c4 = 'stop manual irrigation'
    commands = [c1, c2, c3, c4]
    welcome_note(chat_id, commands)

    while(text.lower() == 'start' or text.lower() == '/start'):
        print(text)
        chat_id, text, update_id = get_last_id_text(get_updates(update_id+1))
        sleep(0.5)
    # print(text)
    while text.lower() not in commands:
        chat_id, text, update_id = get_last_id_text(get_updates(update_id+1))
        sleep(0.5)

    if text.lower() == c1:
        b1(chat_id, update_id)
    elif text.lower() == c2:
        b2(chat_id, update_id)
    elif text.lower() == c3:
        b3(chat_id, update_id)
    else:
        b4(chat_id, update_id)


def main():

    chat_id, text, update_id = get_last_id_text(get_updates())
    chat_id, text, update_id = start(chat_id)
    print('Started')
    sleep(1)

    while True:
        menu(chat_id, 'start', update_id)
        text = 'y'
        chat_id, text, update_id = get_last_id_text(get_updates())


if __name__ == '__main__':
    main()
