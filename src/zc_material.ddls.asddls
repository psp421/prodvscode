@EndUserText.label: 'Material - Consumption View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true

@UI.headerInfo: {
  typeName:       'Material',
  typeNamePlural: 'Materials',
  title:          { type: #STANDARD, label: 'Material',      value: 'Material'     },
  description:    { type: #STANDARD, label: 'Material Type', value: 'MaterialType' }
}

@UI.presentationVariant: [{
  text:             'Default',
  sortOrder:        [{ by: 'Material', direction: #ASC }],
  visualizations:   [{ type: #AS_LINEITEM }]
}]

define root view entity ZC_MATERIAL
  as projection on I_Material
{
      /*-- Object Page Facets --*/
      @UI.facet: [
        {
          id:       'GeneralData',
          purpose:  #STANDARD,
          type:     #IDENTIFICATION_REFERENCE,
          label:    'General Data',
          position: 10
        },
        {
          id:              'WeightVolume',
          purpose:         #STANDARD,
          type:            #FIELDGROUP_REFERENCE,
          targetQualifier: 'WeightVolumeGrp',
          label:           'Weight & Volume',
          position:        20
        },
        {
          id:              'AdditionalInfo',
          purpose:         #STANDARD,
          type:            #FIELDGROUP_REFERENCE,
          targetQualifier: 'AdditionalInfoGrp',
          label:           'Additional Information',
          position:        30
        }
      ]

      /*-- Key: Material Number --*/
      @UI: {
        lineItem:       [{ position: 10, importance: #HIGH,   label: 'Material'        }],
        identification: [{ position: 10,                      label: 'Material'        }],
        selectionField: [{ position: 10                                                }]
      }
      @Search.defaultSearchElement: true
  key Material,

      /*-- Material Type --*/
      @UI: {
        lineItem:       [{ position: 20, importance: #HIGH,   label: 'Material Type'   }],
        identification: [{ position: 20,                      label: 'Material Type'   }],
        selectionField: [{ position: 20                                                }]
      }
      MaterialType,

      /*-- Industry Sector --*/
      @UI: {
        lineItem:       [{ position: 30, importance: #HIGH,   label: 'Industry Sector' }],
        identification: [{ position: 30,                      label: 'Industry Sector' }]
      }
      IndustrySector,

      /*-- Material Group --*/
      @UI: {
        lineItem:       [{ position: 40, importance: #MEDIUM, label: 'Material Group'  }],
        identification: [{ position: 40,                      label: 'Material Group'  }],
        selectionField: [{ position: 30                                                }]
      }
      MaterialGroup,

      /*-- Base Unit of Measure --*/
      @UI: {
        lineItem:       [{ position: 50, importance: #MEDIUM, label: 'Base Unit'       }],
        identification: [{ position: 50,                      label: 'Base Unit'       }]
      }
      BaseUnit,

      /*-- Division --*/
      @UI: {
        lineItem:       [{ position: 60, importance: #MEDIUM, label: 'Division'        }],
        identification: [{ position: 60,                      label: 'Division'        }],
        selectionField: [{ position: 40                                                }]
      }
      Division,

      /*-- External Material Group --*/
      @UI: {
        identification: [{ position: 70, label: 'External Material Group' }]
      }
      ExternalMaterialGroup,

      /*-- Size / Dimension --*/
      @UI: {
        identification: [{ position: 80, label: 'Size / Dimension' }]
      }
      SizeOrDimensionText,

      /*-- Country of Origin --*/
      @UI: {
        identification: [{ position: 90, label: 'Country of Origin' }]
      }
      CountryOfOrigin,

      /*-- Material External Status --*/
      @UI: {
        identification:  [{ position: 100, label: 'Material Status' }],
        selectionField:  [{ position: 50                            }]
      }
      MaterialExternalStatus,

      /*-- Serial Number Profile --*/
      @UI: {
        identification: [{ position: 110, label: 'Serial Number Profile' }]
      }
      SerialNumberProfile,

      /*-- Weight & Volume Field Group --*/
      @UI: {
        fieldGroup:     [{ qualifier: 'WeightVolumeGrp', position: 10, label: 'Gross Weight' }],
        identification: [{ position: 120, label: 'Gross Weight' }]
      }
      GrossWeight,

      @UI: {
        fieldGroup:     [{ qualifier: 'WeightVolumeGrp', position: 20, label: 'Net Weight'   }],
        identification: [{ position: 130, label: 'Net Weight' }]
      }
      NetWeight,

      @UI: {
        fieldGroup:     [{ qualifier: 'WeightVolumeGrp', position: 30, label: 'Weight Unit'  }],
        identification: [{ position: 140, label: 'Weight Unit' }]
      }
      WeightUnit,

      @UI: {
        fieldGroup:     [{ qualifier: 'WeightVolumeGrp', position: 40, label: 'Net Volume'   }],
        identification: [{ position: 150, label: 'Net Volume' }]
      }
      NetVolume,

      @UI: {
        fieldGroup:     [{ qualifier: 'WeightVolumeGrp', position: 50, label: 'Volume Unit'  }],
        identification: [{ position: 160, label: 'Volume Unit' }]
      }
      VolumeUnit,

      /*-- Additional Information Field Group --*/
      @UI: {
        fieldGroup:     [{ qualifier: 'AdditionalInfoGrp', position: 10, label: 'Hazardous Material No.' }],
        identification: [{ position: 170, label: 'Hazardous Material No.' }]
      }
      HazardousMaterialNumber,

      @UI: {
        fieldGroup:     [{ qualifier: 'AdditionalInfoGrp', position: 20, label: 'Material Category' }],
        identification: [{ position: 180, label: 'Material Category' }]
      }
      MaterialCategory,

      @UI: {
        fieldGroup:     [{ qualifier: 'AdditionalInfoGrp', position: 30, label: 'Authorization Group' }],
        identification: [{ position: 190, label: 'Authorization Group' }]
      }
      MaterialAuthorizationGroup,

      /*-- Audit Fields --*/
      @UI: {
        lineItem:       [{ position: 70, importance: #LOW, label: 'Created On'    }],
        identification: [{ position: 200, label: 'Created On' }]
      }
      CreationDate,

      @UI: {
        lineItem:       [{ position: 80, importance: #LOW, label: 'Last Changed'  }],
        identification: [{ position: 210, label: 'Last Changed' }]
      }
      LastChangeDate,

      @UI: {
        lineItem:       [{ position: 90, importance: #LOW, label: 'Deletion Flag' }],
        identification: [{ position: 220, label: 'Deletion Flag' }]
      }
      IsMarkedForDeletion
}
