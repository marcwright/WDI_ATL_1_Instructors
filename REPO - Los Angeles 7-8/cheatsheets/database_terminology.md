#Database Terminology
This is a comparison of data model, relational database, and MongoDB terminology.

<table>
<tr><th>Data Model</th><th>RDBMS</th><th>MongoDB</th></tr>
<tr><td>Entity</td><td>Table</td><td>Collection</td></tr>
<tr><td>Entity instance</td><td>Record/Row</td><td>Document</td></tr>
<tr><td>Attribute or Data Element</td><td>Data element, Field or Column</td><td>Field</td></tr>
<tr><td>Format Domain</td><td>Datatype</td><td>Datatype</td></tr>
<tr><td>Relationship</td><td>Constraint</td><td>Captured but not enforced either through a reference, which is similar to a foreign key, or through embedded documents.</td></tr>
<tr><td>Candidate key (Primary or Alternate key)</td><td>Unique index</td><td>unique index</td></tr>
<tr><td>Surrogate key</td><td>Globally Unique Id (GUID)</td><td>ObjectId</td></tr>
<tr><td>Foreign key</td><td>Foreign key</td><td>Reference</td></tr>
<tr><td>Secondary key, Inversion entry</td><td>Secondary key</td><td>Secondary key</td></tr>
<tr><td>Subtype</td><td>Rolldown, Rollup, Identity</td><td>Rolldown, Rollup, Identity</td></tr>
</table>