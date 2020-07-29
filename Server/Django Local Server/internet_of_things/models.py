from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator


class Environment(models.Model):
    soil_moisture = models.FloatField(blank=False, null=False)
    temperature = models.FloatField(blank=False, null=False)
    humidity = models.FloatField(blank=False, null=False)


class Toggle(models.Model):
    toggle = models.BooleanField(default=False)


class Threshold(models.Model):
    threshold = models.FloatField(
        blank=False, null=False, validators=[MaxValueValidator(100), MinValueValidator(0)]
    )
