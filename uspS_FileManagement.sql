USE Regla_LLD
GO

CREATE proc [dbo].[uspS_FileManagement]          
@period datetime          
, @ApplicationId varchar(100)          
as          
begin          
 SELECT f.PKId, f.sequence, f.Description, f.File_Name, f.File_Name_Pattern, f.Sheet_Name, f.Sheet_Name_Pattern,           
    ISNULL(s.Status,'-') AS Status, s.Last_Update_Date, s.Dtexec_Job_Id, j.Row_Count,           
    '?' AS FileName,'?' AS FileDateTime,'?' AS FileSize,'?' AS Availability, Is_Without_File           
    FROM TblG_File_Management f           
    LEFT JOIN TblG_Step_History s ON f.Step_No=s.Step_No AND datediff(d,s.Period_Date,@period) = 0           
    LEFT JOIN TblG_Dtexec_Job j ON j.Id=s.Dtexec_Job_Id           
    WHERE f.delete_flag=0 and f.application_id like '%' +@ApplicationId      +'%'    
    ORDER BY f.sequence          
end     


select * from TblG_File_Management
  