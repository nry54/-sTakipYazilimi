<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/IsverenPaneli/Isveren.Master"  CodeBehind="GorevListesi.aspx.cs" Inherits="IsTakipYazilimi_GYG.IsverenPaneli.GorevListesi" %>

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
            <h1 style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: x-large; font-weight: bold; font-style: italic; color: #808080; vertical-align: middle; text-align: center; padding: inherit"> Görev Ekleme İşlemleri </h1>
          
            <div class="border round-xlarge" style="border: thin solid #008000">
                 <div> 
                    <table style="width:80%; margin-top:20px;" class="kayit panel panel-default table">
                        <tr>
                            <td class="auto-style1">Personel</td>
                            <td class="auto-style2">:</td>
                            <td>
                                <asp:DropDownList ID="drp_personel" runat="server" DataSourceID="SqlDataSource1" DataTextField="ad_soyad" DataValueField="Id"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IsTakipYazilimi_GYG.Properties.Settings.Setting %>" SelectCommand="SELECT [Id], [ad_soyad] FROM [Kullanici] WHERE ([yetki_id] = 3)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="3" Name="yetki_id2" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                         <tr>
                            <td class="auto-style1">Görev</td>
                            <td class="auto-style2">:</td>
                            <td>
                                <asp:TextBox ID="txt_gorev" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Başlangıç</td>
                            <td class="auto-style2">:</td>
                            <td>
                                <asp:TextBox style="width:160px;" ID="txt_baslangic" runat="server" TextMode="Date"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Bitiş</td>
                            <td class="auto-style2">:</td>
                            <td>
                                <asp:TextBox style="width:160px;" ID="txt_bitis" runat="server" TextMode="Date"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Hedef</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td>
                                <asp:TextBox style="width:160px;" ID="txt_bitis0" runat="server" TextMode="Date"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td>
                                <asp:Button ID="btn_ekle" class="btn btn-success" runat="server" Text="Ekle" OnClick="btn_ekle_Click"/>
                            </td>
                        </tr>
                    </table>
                 </div>
                  <div><hr /></div>
                <div>
                    <div><h3> Görev Listesi </h3></div>
                    <asp:GridView ID="grd_gorevler" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="864px" class="table" Style="padding: 10px;" DataKeyNames="Id">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="No" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                            <asp:BoundField DataField="ad_soyad" HeaderText="Personel" SortExpression="ad_soyad" />
                            <asp:BoundField DataField="gorev" HeaderText="Görev" SortExpression="gorev" />
                            <asp:BoundField DataField="baslangic" HeaderText="Başlangıç Tarihi" SortExpression="baslangic" />
                            <asp:BoundField DataField="bitis" HeaderText="Bitiş Tarihi" SortExpression="bitis" />
                            <asp:BoundField DataField="hedef" HeaderText="Hedef Tarihi" SortExpression="hedef" />
                            <asp:ButtonField ButtonType="Button" CommandName="Delete" HeaderText="" ShowHeader="True" Text="SİL" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IsTakipYazilimi_GYG.Properties.Settings.Setting %>" SelectCommand="SELECT g.[Id],k.[ad_soyad],g.[gorev], g.[baslangic], g.[bitis], g.[hedef] FROM [Gorev] g, [Kullanici] k WHERE (g.[personel_id] = k.[Id])" DeleteCommand="DELETE FROM [Gorev] WHERE [Id] = @Id">
                         <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
    </div>
</asp:Content>

