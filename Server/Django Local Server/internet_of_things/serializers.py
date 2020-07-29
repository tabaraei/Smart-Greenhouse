from rest_framework import serializers
from .models import *


class EnvironmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Environment
        fields = ['id', 'soil_moisture', 'temperature', 'humidity']

    def validate_soil_moisture(self, value):
        if value < 0 or value > 100:
            raise serializers.ValidationError('Only numbers between 0 and 100 are allowed')
        return value

    def validate_humidity(self, value):
        if value < 0 or value > 100:
            raise serializers.ValidationError('Only numbers between 0 and 100 are allowed')
        return value

    def validate_temperature(self, value):
        if value < -10 or value > 70:
            raise serializers.ValidationError('Only numbers between -10 and 70 are allowed')
        return value


class ToggleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Toggle
        fields = '__all__'


class ThresholdSerializer(serializers.ModelSerializer):
    class Meta:
        model = Threshold
        fields = '__all__'
