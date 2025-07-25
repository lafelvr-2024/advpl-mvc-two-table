#include "TOTVS.CH"
#include "FWMVCDEF.CH"

/*/{Protheus.doc} AFAT002
Rotina de manuten��o do cadastro de Tipos de Servi�o de Entrega.
@type function
@version 1.0 
@author Luiz Alves Felizardo
@since 24/07/2025
/*/
User Function AFAT002()

	Local oBrowse := Nil

    //Cria o browser (tela)
	oBrowse := FWMBrowse():New()
        //Tabela principal
		oBrowse:SetAlias("Z01")

        //Nome do cadastro usando a fun��o que captura o nome do dicion�rio
		oBrowse:SetDescription(FWX2Nome("Z01")) 

        //Define onde ser� capturado os menus da rotina.
		oBrowse:SetMenuDef("CUSTOM.FAT.AFAT002")

        //Monta a tela
		oBrowse:Activate()

Return

/*/{Protheus.doc} MenuDef
Defini��o do menu da rotina.
@type function
@version 1.0
@author Luiz Alves Felizardo
@since 24/07/2025
@return array, vetor
/*/
Static Function MenuDef()

	Local aRotina := FWMVCMenu("CUSTOM.FAT.AFAT002") //Func�o padrao que resgata as op��es default da tela (inclus�o, altera��o, exclus�o, visualizar e etc.)

Return aRotina

/*/{Protheus.doc} ModelDef
Defini��o do modelo (model) da rotina.
@type function
@version 1.0  
@author Luiz Alves Felizardo
@since 24/07/2025
@return object, objeto
/*/
Static Function ModelDef()

	Local oModel   := nil
	Local oStruZ01 := FWFormStruct(1, "Z01") //Busca os campos, pastas, gatilhos, F3, valida��es da tabela Z01
    Local oStruZ02 := FWFormStruct(1, "Z02") //Busca os campos, pastas, gatilhos, F3, valida��es da tabela Z02

    //Cria o Model
	oModel := MPFormModel():New("CUSTOM.FAT.AFAT002")

        //Montando o primeiro grupo de campos da tabela Z01
		
        //Nome da se��o usando a fun��o que captura o nome do dicion�rio
        oModel:SetDescription(FWX2Nome("Z01")) 

        //Adiciona os campos ao modelo especificando um nome a �rea do model
		oModel:addFields("Z01MASTER",, oStruZ01)

        //Define a chave prim�ria
		oModel:SetPrimaryKey({"Z01_FILIAL", "Z01_COD"})

        //Define quais campos n�o ser�o copiados quando o usu�rio usar a op��o padr�o do browser COPIAR
		oModel:GetModel("Z01MASTER"):SetFldNoCopy({"Z01_COD"})

        //T�tulo da se��o usando a fun��o que captura o nome do dicion�rio
		oModel:GetModel("Z01MASTER"):SetDescription(FWX2Nome("Z01"))

        
        //Montando o Segundo grupo de campos da tabela Z02

        //Adiciona os campos ao modelo especificando um nome a �rea do model
        oModel:AddFields("Z02DETAIL", "Z01MASTER", oStruZ02)

        //Define o relacionamento da tabela da primeira se��o com a segunda.
        oModel:SetRelation("Z02DETAIL", {{"Z02_FILIAL", "FwXFilial('Z02')"}, {"Z02_SERV", "Z01_COD"}}, Z02->(IndexKey(3)))

        //Define a chave prim�ria
		oModel:SetPrimaryKey({"Z02_FILIAL", "Z02_COD", "Z02_SERV"})

        //Define quais campos n�o ser�o copiados quando o usu�rio usar a op��o padr�o do browser COPIAR
		oModel:GetModel("Z02DETAIL"):SetFldNoCopy({"Z02_COD", "Z02_SERV"})

        //T�tulo da se��o usando a fun��o que captura o nome do dicion�rio
		oModel:GetModel("Z02DETAIL"):SetDescription(FWX2Nome("Z02"))

Return oModel

/*/{Protheus.doc} ViewDef
Defini��o da vis�o (view) da rotina.
@type function
@version 1.0  
@author Luiz Alves Felizardo
@since 24/07/2025
@return object, objeto
/*/
Static Function ViewDef()

	Local oView    := Nil
	Local oModel   := ModelDef() //Pega o modelo constru�do na fun��o ModelDef.
	Local oStruZ01 := FWFormStruct(2, "Z01") //Busca os campos, pastas, gatilhos, F3, valida��es da tabela Z01
    Local oStruZ02 := FWFormStruct(2, "Z02") //Busca os campos, pastas, gatilhos, F3, valida��es da tabela Z02

	oView := FWFormView():New()
        //Define na visualiza��o qual o model ser� usado para montagem da tela.
		oView:SetModel(oModel)

        //Define uma fun��o padr�o para o bot�o fechar, podendo adicionar uma fun��o pr�pria para validar alguma situa��o se necess�rio.
		oView:bCloseOnOk := {|| .T.}

        //Define se a mensagem de dados atualizadas ser� apresentada.
		oView:ShowUpdateMsg(.F.)

        //Remove um campo para n�o ser exxibido, no caso como Z02 � uma tabela relacionada, n�o precisamos mostrar o Z02_SERV que � o mesmo conte�do do Z01_COD.
        oStruZ02:RemoveField("Z02_SERV")

        //Remove um campo para n�o ser exxibido, no caso como Z02 � uma tabela relacionada, n�o precisamos mostrar o Z02_COD que ser� preenchido automaticamente e n�o deve ser alterado.
        oStruZ02:RemoveField("Z02_COD")

        //Adicionando os campos de cada grupo
		oView:AddField("VIEW_Z01", oStruZ01, "Z01MASTER")
        oView:AddField("VIEW_Z02", oStruZ02, "Z02DETAIL")

        //Cria as caixas conforme necessidade e define sua propor��o em porcentagem de cobertura da tela.
        oView:CreateHorizontalBox("BOX_Z01", 30)
        oView:CreateHorizontalBox("BOX_Z02", 70)

        //Relaciona quais estruturas (campos) ser�o apresentadas em qual caixa
        oView:SetOwnerView("VIEW_Z01", "BOX_Z01")
        oView:SetOwnerView("VIEW_Z02", "BOX_Z02")

        //Define o t�tulo de cada uma das caixas.
        oView:EnableTitleView("VIEW_Z01", FWX2Nome("Z01"))
        oView:EnableTitleView("VIEW_Z02", FWX2Nome("Z02"))

Return oView
