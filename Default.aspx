<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IsTakipYazilimi_GYG._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>İŞ TAKİP SİSTEMİ</h1>
    </div>

    <div class="row">
        <table style="width: 100%;">
            <tr>
                <td class="auto-style1">Kullanıcı Adı</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:TextBox class="form-control" ID="txt_k_ad" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Parola</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:TextBox  class="form-control" ID="txt_parola" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button  class="btn btn-info" ID="btn_giris" runat="server" Text="Giriş" Width="69px" OnClick="btn_giris_Click" />
                    
                </td>
            </tr>

                    <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    
                   <asp:Label ID="Label3" runat="server" Text="Label3" Visible="False"></asp:Label>
                </td>
            </tr>

        </table>
    </div>

</asp:Content>
