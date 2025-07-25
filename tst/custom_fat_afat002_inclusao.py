from tir import Webapp
from datetime import datetime
import unittest
import time

DataSystem = datetime.today().strftime('%d/%m/%Y')

teste_fat = Webapp()
teste_fat.Setup('SIGAFAT', DataSystem, '99', '01', '05')
teste_fat.Program("AFAT002")
teste_fat.SetButton("Incluir")

teste_fat.SetValue("Z01_DESC", "EXCELSIOR")
teste_fat.SetValue("Z01_TIPO", "2")

teste_fat.SetValue("Z02_CNPJ"  , "25748644000193")
teste_fat.SetValue("Z02_CONTRA", "00099999")
teste_fat.SetValue("Z02_AGENCI", "00099")
teste_fat.SetValue("Z02_ADESAO", DataSystem)
teste_fat.SetValue("Z02_VENCTO", DataSystem)
teste_fat.SetButton("Confirma")
teste_fat.TearDown()
