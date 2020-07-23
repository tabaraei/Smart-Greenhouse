import requests

# ------------------------ Get records ------------------------


def getLastNRecords(n):
    res = requests.post(
        'http://192.168.1.102:8000/api/environments/list_last_n/', data={'number': n})
    return res.json()['result']


def lastRecord():
    result = getLastNRecords(1)[0]
    temperature = '🌡' + \
        ' Temperature: {}°C'.format(str(result['temperature']))
    humidity = '🌦' + \
        ' Humidity: {}%'.format(str(int(result['humidity'])))
    weather = '🌱' + \
        ' Soil Moisture: {}%'.format(
            str(int(result['soil_moisture'])))

    message = '\n'.join([temperature, humidity, weather])
    return message


def last10Records():
    message = ''
    firstTime = True
    for record in getLastNRecords(10):
        if firstTime:
            firstTime = False
        else:
            message += '\n' + '--------------------------------------' + '\n'
        identifier = '🆔' + \
            ' ID: [{}]'.format(str(record['id']))
        temperature = '🌡' + \
            ' Temperature: {}°C'.format(str(record['temperature']))
        humidity = '🌦' + \
            ' Humidity: {}%'.format(str(int(record['humidity'])))
        weather = '🌱' + \
            ' Soil Moisture: {}%'.format(
                str(int(record['soil_moisture'])))
        message += '\n'.join([identifier, temperature, humidity, weather])

    return message

# -------------------------- Irrigate -------------------------


def startIrrigate():
    requests.put(
        'http://192.168.1.102:8000/api/toggles/1/', data={'toggle': True})
    return 'Irrigation Started successfully'


def stopIrrigate():
    requests.put(
        'http://192.168.1.102:8000/api/toggles/1/', data={'toggle': False})
    return 'Irrigation Stopped successfully'
