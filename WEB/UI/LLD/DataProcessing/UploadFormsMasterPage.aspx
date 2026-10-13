<%@ page language="C#" masterpagefile="~/RRR.master" autoeventwireup="true" inherits="LHBU_UploadForms_UploadFormsMasterPage, App_Web_uploadformsmasterpage.aspx.375367ca" title="Upload Forms" viewStateEncryptionMode="Never" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ctContent" runat="Server">

    <script language="javascript" type="text/javascript">

        function defined(o) {
            return typeof (o) != "undefined";
        }

        function isArray(o) {
            // If these conditions aren't met, it certainly isn't an Array
            if (o == null || typeof (o) != "object" || typeof (o.length) != "number") {
                return false;
            }
            // Check to see if the object is an instance of the window's Array object
            if (defined(Array) && defined(o.constructor) && o.constructor == Array) {
                return true;
            }
            // It might be an array defined from another window object - check to see
            // if it has an Array's methods
            if (typeof (o.join) == "function" && typeof (o.sort) == "function" && typeof (o.reverse) == "function") {
                return true;
            }
            // As a last resort, let's see if index [0] is defined
            return (o.length == 0 || defined(o[0]));
        }

        function Check(chk) {
            if (chk == null) return;

            if (document.aspnetForm.check_control.checked == true) {
                if (isArray(chk)) {
                    for (i = 0; i < chk.length; i++)
                        chk[i].checked = true;
                } else chk.checked = true;
            } else {
                if (isArray(chk)) {
                    for (i = 0; i < chk.length; i++)
                        chk[i].checked = false;
                } else chk.checked = false;
            }
        }

        function newWindow(url) {
            popupWindow = window.open(url, 'WINDOW', 'height=500,width=700,left=50,top=50,resizable=no,scrollbars=no,toolbar=no,menubar=no,location=no,directories=no, status=no');
        }

    </script>

    <table>
        <tr>
            <td style="font-family: Tahoma; font-size: 12px;">Period:</td>
            <td>
                <dx:ASPxDateEdit ID="period" EditFormat="Custom" EditFormatString="dd/MM/yyyy" runat="server" CalendarProperties-ShowClearButton="false" AllowNull="false" OnDateChanged="period_DateChanged" AutoPostBack="true">
                </dx:ASPxDateEdit>
            </td>
            <td>
                <dx:ASPxButton ID="btnProcess" ClientInstanceName="btnprocess" runat="server" Text="Process" OnClick="btnProcess_Click"
                    >
                </dx:ASPxButton>
            </td>
            <td>
                <dx:ASPxButton ID="btnRefresh" ClientInstanceName="btnrefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" 
                    >
                </dx:ASPxButton>
            </td>
        </tr>
    </table>

    <dx:ASPxLabel ID="lblMessage" runat="server" ForeColor="blue" Text="">
    </dx:ASPxLabel>

    <dx:ASPxGridView ID="gv1" runat="server" SettingsBehavior-AllowSort="false"
        AutoGenerateColumns="false" KeyFieldName="PKId" OnHtmlRowCreated="gv1_HtmlRowCreated"
        Width="1000px">
        <Columns>
            <dx:GridViewDataColumn Caption="No" VisibleIndex="0" Width="50px">
                <EditFormSettings Visible="false" />
                <HeaderCaptionTemplate>
                    No&nbsp;<input name="check_control" type="checkbox" onclick="Check(document.aspnetForm.check_list)" />
                </HeaderCaptionTemplate>
                <DataItemTemplate>
                    <dx:ASPxLabel ID="lblNo" runat="server" Text="">
                    </dx:ASPxLabel>
                    <input name="check_list" type="checkbox" value="<%# Eval("PKId") %>" id="chk_<%# Eval("PKId") %>" />
                </DataItemTemplate>
            </dx:GridViewDataColumn>
            <dx:GridViewDataTextColumn Caption="Caption" FieldName="Description" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="File Name" FieldName="FileName" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Availability" FieldName="Availability" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Status" FieldName="Status" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Status Last Update" FieldName="Last_Update_Date" VisibleIndex="6">
                <PropertiesTextEdit DisplayFormatString="dd MMM yyyy HH:mm"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="File Date Time" FieldName="FileDateTime" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="File Size" FieldName="FileSize" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="# Record" FieldName="Row_Count" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn Caption="Message" FieldName="Dtexec_Job_Id" VisibleIndex="10">
                <PropertiesHyperLinkEdit Text="Show" NavigateUrlFormatString="JavaScript:newWindow('DtexecJobMsg.aspx?id={0}')">
                </PropertiesHyperLinkEdit>
            </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataTextColumn Caption="Sequence" FieldName="sequence" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="true" />
        <Settings ShowTitlePanel="true" />
        <SettingsEditing Mode="PopupEditForm" PopupEditFormModal="true" PopupEditFormWidth="700px" />
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <Styles>
            <Header ImageSpacing="10px" SortingImageSpacing="10px">
            </Header>
        </Styles>
        <Images ImageFolder="~/App_Themes/Plastic Blue/{0}/">
            <CollapsedButton Height="10px" Url="~/App_Themes/Plastic Blue/GridView/gvCollapsedButton.png"
                Width="9px" />
            <ExpandedButton Height="9px" Url="~/App_Themes/Plastic Blue/GridView/gvExpandedButton.png"
                Width="9px" />
            <HeaderFilter Height="15px" Url="~/App_Themes/Plastic Blue/GridView/gvHeaderFilter.png"
                Width="13px" />
            <HeaderActiveFilter Height="15px" Url="~/App_Themes/Plastic Blue/GridView/gvHeaderFilterActive.png"
                Width="13px" />
            <HeaderSortDown Height="11px" Url="~/App_Themes/Plastic Blue/GridView/gvHeaderSortDown.png"
                Width="11px" />
            <HeaderSortUp Height="11px" Url="~/App_Themes/Plastic Blue/GridView/gvHeaderSortUp.png"
                Width="11px" />
        </Images>
        <SettingsPager ShowDefaultImages="False">
            <AllButton Text="All">
            </AllButton>
            <NextPageButton Text="Next &gt;">
            </NextPageButton>
            <PrevPageButton Text="&lt; Prev">
            </PrevPageButton>
        </SettingsPager>
    </dx:ASPxGridView>
</asp:Content>


