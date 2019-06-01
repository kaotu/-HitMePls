from django.contrib import admin 
from django.test import TestCase

from ..models import Hitter
from ..admin import HitterAdmin


class HitterAdminTest(TestCase):
    def test_hitter_should_be_registed_to_admin(self):
        self.assertIsInstance(
	    admin.site._registry[Hitter],
	    HitterAdmin
	)

    def test_hitter_admin_should_set_list_display(self):
        expected = (
	    'email',
	)
        self.assertEqual(HitterAdmin.list_display, expected)
