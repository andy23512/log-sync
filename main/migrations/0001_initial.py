# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2018-03-29 09:49
from __future__ import unicode_literals

from django.db import migrations, models
import main.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Process',
            fields=[
                ('pid', models.CharField(default=main.models.random_key, max_length=16, primary_key=True, serialize=False)),
            ],
        ),
    ]
