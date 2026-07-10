# RAP Material Fiori Elements App — Package YPROD

Read-only Fiori Elements List Report + Object Page for Material master data,
built on the standard cloud-released CDS view `I_Material` (MARA).

## Objects

| File | ABAP Object | Type | Description |
|------|-------------|------|-------------|
| `zc_material.ddls.asddls` | ZC_MATERIAL | CDS Projection View | Consumption view on I_Material with full UI annotations |
| `zc_material.dcls.asdcls` | ZC_MATERIAL | Access Control (DCL) | Inherits auth conditions from I_Material |
| `zsd_material.srvd.asddls` | ZSD_MATERIAL | Service Definition | Exposes ZC_MATERIAL as `Material` entity |

> **Service Binding (ZSB_MATERIAL)** — Create manually in ADT after import:
> `New → Other ABAP Repository Object → Business Services → Service Binding`
> - Name: `ZSB_MATERIAL`
> - Service Definition: `ZSD_MATERIAL`
> - Binding Type: **OData V4 - UI**
> Then click **Publish** in the service binding editor.

## Standard Base View

| View | Release | Package | Description |
|------|---------|---------|-------------|
| `I_Material` | **C1 (Cloud API)** | MATM | Material master based on MARA table |

## Import via abapgit in Eclipse

1. Open Eclipse → Window → abapgit Repositories
2. Click **New Online** → URL: `https://github.com/psp421/prodvscode.git`
3. Package: **YPROD** (create if it does not exist; set Software Component = LOCAL)
4. Click **Pull** — all three objects are imported flat into YPROD
5. Activate all objects (Ctrl+F3 in ADT)
6. Create service binding **ZSB_MATERIAL** manually (see above) and click **Publish**
7. Launch the Fiori Elements preview directly from the service binding editor

## App Features

- **List Report**: Material, Material Type, Industry Sector, Material Group, Base Unit, Division, Created On, Changed On, Deletion Flag
- **Selection Fields**: Material, Material Type, Material Group, Division, Material Status
- **Object Page** with 3 facets:
  - *General Data* — all identification fields
  - *Weight & Volume* — GrossWeight, NetWeight, WeightUnit, NetVolume, VolumeUnit
  - *Additional Information* — HazardousMaterialNumber, MaterialCategory, Authorization Group
