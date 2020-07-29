from django.contrib import admin
from .models import *


class EnvironmentAdmin(admin.ModelAdmin):
    list_display = ['soil_moisture', 'temperature', 'humidity']


class ToggleAdmin(admin.ModelAdmin):
    list_display = ['toggle']


class ThresholdAdmin(admin.ModelAdmin):
    list_display = ['threshold']


admin.site.register(Environment, EnvironmentAdmin)
admin.site.register(Toggle, ToggleAdmin)
admin.site.register(Threshold, ThresholdAdmin)
