from tir import Webapp
from datetime import datetime
import unittest
import time

DataSystem = datetime.today().strftime('%d/%m/%Y')

teste_fat = Webapp()
teste_fat.Setup('SIGAFAT', DataSystem, '99', '01', '05')
teste_fat.Program("AFAT002")
teste_fat.SearchBrowse("  000010", key=1, index=True)
teste_fat.SetButton("Outras Ações")
teste_fat.ClickMenuPopUpItem("Excluir")
teste_fat.SetButton("Confirma")
teste_fat.TearDown()