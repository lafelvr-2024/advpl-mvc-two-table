from tir import Webapp
from datetime import datetime
import unittest
import time

DataSystem = datetime.today().strftime('%d/%m/%Y')

teste_fat = Webapp()
teste_fat.Setup('SIGAFAT', DataSystem, '99', '01', '05')
teste_fat.Program("AFAT002")
teste_fat.SearchBrowse("  000010", key=1, index=True)
teste_fat.SetButton("Alterar")
teste_fat.SetValue("Z01_DESC", "EXCELSIOR LOGISTICA")
teste_fat.SetValue("Z01_TIPO", "2")
teste_fat.SetValue("Z02_CNPJ"  , "25748644000193")
teste_fat.SetValue("Z02_CONTRA", "000254899")
teste_fat.SetValue("Z02_AGENCI", "00023")
teste_fat.SetValue("Z02_ADESAO", DataSystem)
teste_fat.SetValue("Z02_VENCTO", DataSystem)
teste_fat.SetButton("Confirma")
teste_fat.TearDown()
