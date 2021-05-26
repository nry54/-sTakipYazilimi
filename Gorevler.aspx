<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gorevler.aspx.cs" Inherits="IsTakipYazilimi_GYG.Gorevler" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Görevler</title>
    <style>
        table{margin-top:30px;}
            td{padding:5px 10px 5px 10px;}    
            th{padding:5px 10px 5px 10px; color:#276B7B;}    

    </style>
</head>
<body>
     <form class=" panel" style=""  id="form1" runat="server" >


    <div>
        çalışan ise görevlerini görsün
        <!--
        <asp:GridView ID="GridView1" class="table" style="padding:10px; "  runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns >
               <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                <asp:BoundField DataField="personel" HeaderText="personel" SortExpression="personel" />
                <asp:BoundField DataField="is_paketi" HeaderText="is_paketi" SortExpression="is_paketi" />
                <asp:BoundField DataField="gorev" HeaderText="gorev" SortExpression="gorev" />
                <asp:BoundField DataField="arastirma" HeaderText="arastirma" SortExpression="arastirma" />
                <asp:BoundField DataField="calisma" HeaderText="calisma" SortExpression="calisma" />
                <asp:BoundField DataField="baslangic" HeaderText="baslangic" SortExpression="baslangic" />
                <asp:BoundField DataField="bitis" HeaderText="bitis" SortExpression="bitis" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:istakipConnectionString %>" SelectCommand="SELECT [id], [personel], [is_paketi], [gorev], [arastirma], [calisma], [tamamlandi], [baslangic], [bitis] FROM [gorev]"></asp:SqlDataSource>
        -->
    </div>

        <div>


    <asp:Button Class="btn btn-info" ID="btn_yenigorevKayit" style=" float:right;" runat="server" Text="Yeni Kayıt" Width="91px"/>


</div>
    </form>
</body>
</html>
