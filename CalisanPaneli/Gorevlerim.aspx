<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gorevlerim.aspx.cs" MasterPageFile="~/CalisanPaneli/Calisan.Master" Inherits="IsTakipYazilimi_GYG.CalisanPaneli.Gorevlerim" %>

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
        <div>
            <h1 style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: x-large; font-weight: bold; font-style: italic; color: #808080; vertical-align: middle; text-align: center; padding: inherit"> Görevlerim </h1>
            <div class="border round-xlarge" style="border: thin solid #008000">
                <asp:GridView ID="grd_gorevlerim" runat="server" Width="923px" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" OnRowCommand="grd_gorevlerim_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="No" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="gorev" HeaderText="Görev" SortExpression="gorev" />
                        <asp:BoundField DataField="baslangic" HeaderText="Başlangiç" SortExpression="baslangic" />
                        <asp:BoundField DataField="bitis" HeaderText="Bitis" SortExpression="bitis" />
                        <asp:BoundField DataField="hedef" HeaderText="Hedef" SortExpression="hedef" />
                        <asp:ButtonField ButtonType="Button" CommandName="Tamamlandı" HeaderText="" ShowHeader="True" Text="TAMAMLANDI" />
                    </Columns>
                </asp:GridView>
               
                <asp:Label ID="lbl_session" runat="server" Text="" Visible="false"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IsTakipYazilimi_GYG.Properties.Settings.Setting %>" SelectCommand="SELECT g.Id, g.gorev, g.baslangic, g.bitis, g.hedef, g.tamamlanma_durumu FROM Gorev AS g INNER JOIN Kullanici AS k ON g.personel_id = k.Id WHERE (k.kullanici_adi = @session_deger  AND g.tamamlanma_durumu IS NULL)" >
                   <SelectParameters>
                        <asp:Parameter Name="session_deger" Type="String" DefaultValue="" />
                   </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
     </div>

</asp:Content>
