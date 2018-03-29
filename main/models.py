from __future__ import unicode_literals
import random
import string

from django.db import models

# Create your models here.


def random_key():
    return ''.join(random.choice(string.ascii_letters) for i in range(16))


class Process(models.Model):
    pid = models.CharField(max_length=16, default=random_key, primary_key=True)
