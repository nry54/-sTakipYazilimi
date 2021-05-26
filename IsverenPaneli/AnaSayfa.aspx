<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/IsverenPaneli/Isveren.Master" CodeBehind="AnaSayfa.aspx.cs" Inherits="IsTakipYazilimi_GYG.IsverenPaneli.AnaSayfa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <style type="text/css">
        .auto-style1 {
            width: 97px;
        }
        .auto-style2 {
            width: 17px;
        }
            .kayit{color:#276B7B; font-weight:bold;}    
            tr{border:1px solid gray;} 
            th{color:#276B7B;}
    </style>

    <div style="margin-left:25%">
            <h1 style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: x-large; font-weight: bold; font-style: italic; color: #808080; vertical-align: middle; text-align: center; padding: inherit"> Kullanıcı Ekleme İşlemleri </h1>
          
            <div class="border round-xlarge" style="border: thin solid #008000">
                <div><h3>  Kullanıcı Ekle </h3></div>
                <div> 
                    <table  style="width:80%; margin-top:20px;" class="kayit panel panel-default table">
                        <tr>
                            <td class="auto-style1"> Ad soyad </td>
                            <td class="auto-style2">:</td>
                            <td> <asp:TextBox ID="txt_ad_soyad" runat="server"></asp:TextBox> </td>
                        </tr>
                        <tr>
                            <td class="auto-style1"> Kullanıcı Adı </td>
                            <td class="auto-style2">:</td>
                            <td> <asp:TextBox ID="txt_kullanici_adi" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr> 
                            <td class="auto-style1"> Parola </td>
                            <td class="auto-style2">:</td>
                            <td> <asp:TextBox ID="txt_parola" runat="server" TextMode="Password"></asp:TextBox> </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">  Yetki </td>
                            <td class="auto-style2">:</td>
                            <td>  
                                <asp:DropDownList ID="drp_yetki" runat="server">
                                    <asp:ListItem Value="1">Admin</asp:ListItem>
                                    <asp:ListItem Value="2">İşveren</asp:ListItem>
                                    <asp:ListItem Value="3">Calışan</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td> <asp:Button ID="btn_kaydet" runat="server" Text="KAYDET" OnClick="btn_kaydet_Click" /></td>
                        </tr>
                    </table>
                </div>
                <div><hr /></div>
                <div>
                    <div><h3> Kullanıcı Listesi </h3></div>
                    <asp:GridView ID="grd_kullanicilar" runat="server" class="table" Style="padding: 10px;" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnRowCommand="grd_kullanicilar_RowCommand" Width="855px">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="No" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                            <asp:BoundField DataField="ad_soyad" HeaderText="Ad Soyad" SortExpression="ad_soyad"></asp:BoundField>
                            <asp:ButtonField ButtonType="Button" CommandName="Delete" HeaderText="" ShowHeader="True" Text="SİL" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" SelectCommand="SELECT [Id], [kullanici_adi], [parola], [ad_soyad], [yetki_id] FROM [Kullanici]" DeleteCommand="DELETE FROM [Kullanici] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Kullanici] ([kullanici_adi], [parola], [ad_soyad], [yetki_id]) VALUES (@kullanici_adi, @parola, @ad_soyad, @yetki_id)" UpdateCommand="UPDATE [Kullanici] SET [ad_soyad] = @ad_soyad WHERE [Id] = @Id" ConnectionString='<%$ ConnectionStrings:IsTakipYazilimi_GYG.Properties.Settings.Setting %>'>
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="kullanici_adi" Type="String"></asp:Parameter>
                            <asp:Parameter Name="parola" Type="String"></asp:Parameter>
                            <asp:Parameter Name="ad_soyad" Type="String"></asp:Parameter>
                            <asp:Parameter Name="yetki_id" Type="Int32"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ad_soyad" Type="String"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
   
    </div>
</asp:Content>

