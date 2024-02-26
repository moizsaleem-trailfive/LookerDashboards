
- dashboard: testdashboards
  title: Testdashboards
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: n7K4QO7f8R3ilrYiyTjeKD
  elements:
  - title: Clicks
    name: Clicks
    model: NoBrothersModel
    explore: events_NoBrothers
    type: single_value
    fields: [events_NoBrothers.total_clicks]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: to_string("Coming Soon")
      label: Graph
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: graph
      _type_hint: string
      is_disabled: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Clicks
    defaults_version: 1
    hidden_fields: []
    hidden_pivots: {}
    listen:
      Date: events_NoBrothers.date_date
      Campaign: events_NoBrothers.campaign_name_clicks
      JobBoard: events_NoBrothers.UTM_SOURCE_Clicks
    row: 0
    col: 3
    width: 3
    height: 3
  - title: Clicks
    name: Clicks
    model: NoBrothersModel
    explore: events_NoBrothers
    type: single_value
    fields: [events_NoBrothers.total_clicks]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: to_string("Coming Soon")
      label: Graph
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: graph
      _type_hint: string
      is_disabled: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Clicks
    defaults_version: 1
    hidden_fields: []
    hidden_pivots: {}
    listen:
      Date: events_NoBrothers.date_date
      Campaign: events_NoBrothers.campaign_name_clicks
      JobBoard: events_NoBrothers.UTM_SOURCE_Clicks
    row: 0
    col: 3
    width: 3
    height: 3
  - title: Total Spends
    name: Total Spends
    model: NoBrothersModel
    explore: events_NoBrothers
    type: single_value
    fields: [job_board_budget_amount.budget, events_NoBrothers.date_date]
    fill_fields: [events_NoBrothers.date_date]
    filters:
      events_NoBrothers.campaign_name: ''
    sorts: [job_board_budget_amount.budget desc]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: sum(${total_spend})
      label: Total Budget
      value_format:
      value_format_name: eur
      _kind_hint: measure
      table_calculation: total_budget
      _type_hint: number
    - category: table_calculation
      expression: "${job_board_budget_amount.budget}/${number_of_days}"
      label: Total Spend
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: total_spend
      _type_hint: number
    - category: table_calculation
      expression: extract_days(add_days(-1, date(extract_years(add_months(1, ${events_NoBrothers.date_date})),
        extract_months(add_months(1, ${events_NoBrothers.date_date})), 1)))
      label: number_of_days
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: number_of_days
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total Spends
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Sollicitaties, orientation: left, series: [{axisId: events_NoBrothers.sollitatie,
            id: events_NoBrothers.sollitatie, name: Sollitatie}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Date
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [job_board_budget_amount.budget, total_spend, number_of_days]
    listen:
      Date: events_NoBrothers.date_date
      Campaign: campaign.name
      JobBoard: jobboard.job_name
    row: 13
    col: 0
    width: 5
    height: 4
  - title: All Applications (Unrelated)
    name: All Applications (Unrelated)
    model: NoBrothersModel
    explore: events_NoBrothers
    type: single_value
    fields: [events_NoBrothers.all_sollicitatie, events_NoBrothers.sollicitatie]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: "${events_NoBrothers.all_sollicitatie}-${events_NoBrothers.sollicitatie}"
      label: Unrelated Sollicitaties
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: unrelated_sollicitaties
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: All Applications (Unrelated)
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Sollicitaties, orientation: left, series: [{axisId: events_NoBrothers.sollitatie,
            id: events_NoBrothers.sollitatie, name: Sollitatie}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Date
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [events_NoBrothers.sollitatie, events_NoBrothers.all_sollitatie,
      events_NoBrothers.all_sollicitatie, events_NoBrothers.sollicitatie]
    listen:
      Date: events_NoBrothers.date_date
    row: 21
    col: 0
    width: 5
    height: 4
  - title: All Applications (Unrelated)
    name: All Applications (Unrelated) (2)
    model: NoBrothersModel
    explore: events_NoBrothers
    type: looker_line
    fields: [events_NoBrothers.all_sollicitatie, events_NoBrothers.sollicitatie, events_NoBrothers.date_date]
    fill_fields: [events_NoBrothers.date_date]
    filters:
      events_NoBrothers.traffic_source__source: ''
    sorts: [events_NoBrothers.date_date desc]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: "${events_NoBrothers.all_sollicitatie}-${events_NoBrothers.sollicitatie}"
      label: Unrelated Sollicitaties
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: unrelated_sollicitaties
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: All Applications (Unrelated), orientation: left, series: [{axisId: unrelated_sollicitaties,
            id: unrelated_sollicitaties, name: Unrelated Sollicitaties}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: All Sollicitaties (Unrelated)
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [events_NoBrothers.sollitatie, events_NoBrothers.all_sollitatie,
      events_NoBrothers.all_sollicitatie, events_NoBrothers.sollicitatie]
    listen:
      Date: events_NoBrothers.date_date
    row: 21
    col: 5
    width: 13
    height: 4
  - name: Conv Rate
    title: Conv Rate
    merged_queries:
    - model: NoBrothersModel
      explore: events_NoBrothers
      type: table
      fields: [events_NoBrothers.date_date, events_NoBrothers.total_clicks]
      fill_fields: [events_NoBrothers.date_date]
      sorts: [events_NoBrothers.date_date desc]
      limit: 500
      column_limit: 50
      hidden_pivots: {}
    - model: NoBrothersModel
      explore: events_NoBrothers
      type: table
      fields: [events_NoBrothers.date_date, events_NoBrothers.sollicitatie]
      fill_fields: [events_NoBrothers.date_date]
      sorts: [events_NoBrothers.date_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: "${job_board_budget_amount.budget}/30"
        label: Total Spend
        value_format:
        value_format_name:
        _kind_hint: measure
        table_calculation: total_spend
        _type_hint: number
        is_disabled: true
      hidden_pivots: {}
      join_fields:
      - field_name: events_NoBrothers.date_date
        source_field_name: events_NoBrothers.date_date
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Conv Rate
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [spends, number_of_days, events_NoBrothers.sollicitatie, events_NoBrothers.total_clicks]
    hidden_pivots: {}
    dynamic_fields:
    - category: table_calculation
      expression: sum(${events_NoBrothers.sollicitatie})/sum(${events_NoBrothers.total_clicks})
      label: Conv Rate
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: conv_rate
      _type_hint: number
    listen:
    - Date: events_NoBrothers.date_date
      Campaign: events_NoBrothers.campaign_name_page_views
      JobBoard: events_NoBrothers.UTM_SOURCE_Page_views
    - Date: events_NoBrothers.date_date
      Campaign: campaign.name
      JobBoard: jobboard.job_name
    row: 17
    col: 0
    width: 5
    height: 4
  - name: Graph
    title: Graph
    merged_queries:
    - model: NoBrothersModel
      explore: events_NoBrothers
      type: looker_line
      fields: [events_NoBrothers.date_date, events_NoBrothers.total_page_views]
      fill_fields: [events_NoBrothers.date_date]
      sorts: [events_NoBrothers.date_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: to_number("0")
        label: Hired
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: hired
        _type_hint: number
        is_disabled: true
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: ''
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      show_null_points: true
      interpolation: linear
      x_axis_label: Date
      x_axis_zoom: true
      y_axis_zoom: true
      series_colors:
        events_NoBrothers.total_clicks: "#E52592"
        events_NoBrothers.total_hired: "#12B5CB"
      custom_color_enabled: true
      show_single_value_title: true
      single_value_title: Vacancies
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      defaults_version: 1
      hidden_fields: []
      hidden_pivots: {}
    - model: NoBrothersModel
      explore: events_NoBrothers
      type: table
      fields: [events_NoBrothers.total_clicks, events_NoBrothers.date_date]
      fill_fields: [events_NoBrothers.date_date]
      limit: 500
      join_fields:
      - field_name: events_NoBrothers.date_date
        source_field_name: events_NoBrothers.date_date
    - model: NoBrothersModel
      explore: events_NoBrothers
      type: table
      fields: [cph.date_date, cph.total_hired]
      fill_fields: [cph.date_date]
      limit: 500
      join_fields:
      - field_name: cph.date_date
        source_field_name: events_NoBrothers.date_date
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Date
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    series_colors:
      events_NoBrothers.total_clicks: "#12B5CB"
      events_NoBrothers.total_hired: "#12B5CB"
      cph.total_hired: "#E52592"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    type: looker_line
    hidden_pivots: {}
    hidden_fields: [cpa.customer_id]
    listen:
    - Date: events_NoBrothers.date_date
      Campaign: events_NoBrothers.campaign_name_page_views
      JobBoard: events_NoBrothers.UTM_SOURCE_Page_views
    - Date: events_NoBrothers.date_date
      Campaign: events_NoBrothers.campaign_name_clicks
      JobBoard: events_NoBrothers.UTM_SOURCE_Clicks
    - Date: cph.date_date
      Campaign: combine_data_nb.campaign_name
      JobBoard: events_NoBrothers.Jobboard_name
    row: 3
    col: 0
    width: 21
    height: 6
  - title: Vacancies
    name: Vacancies
    model: GA4
    explore: vacancy
    type: single_value
    fields: [vacancy.vacancy_count, campaign.clientid, client.name]
    filters:
      campaign.clientid: '125'
    sorts: [vacancy.vacancy_count desc 0]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Vacancies
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    defaults_version: 1
    hidden_fields: [campaign.clientid]
    listen:
      Campaign: campaign.name
      JobBoard: jobboard.job_name
    row: 0
    col: 0
    width: 3
    height: 3
  - title: Sollicitaties
    name: Sollicitaties
    model: NoBrothersModel
    explore: events_NoBrothers
    type: single_value
    fields: [events_NoBrothers.sollicitatie]
    limit: 500
    column_limit: 50
    total: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Applications
    hidden_pivots: {}
    hidden_fields: []
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Date: events_NoBrothers.date_date
      Campaign: combine_data_nb.campaign_name
      JobBoard: events_NoBrothers.Jobboard_name
    row: 9
    col: 0
    width: 5
    height: 4
  - title: Applications
    name: Applications
    model: NoBrothersModel
    explore: events_NoBrothers
    type: looker_line
    fields: [events_NoBrothers.date_date, events_NoBrothers.sollicitatie]
    fill_fields: [events_NoBrothers.date_date]
    sorts: [events_NoBrothers.date_date desc]
    limit: 500
    column_limit: 50
    total: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Applications, orientation: left, series: [{axisId: events_NoBrothers.sollicitatie,
            id: events_NoBrothers.sollicitatie, name: Sollicitatie}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Sollicitaties
    hidden_pivots: {}
    hidden_fields: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Date: events_NoBrothers.date_date
      Campaign: combine_data_nb.campaign_name
      JobBoard: events_NoBrothers.Jobboard_name
    row: 9
    col: 5
    width: 13
    height: 4
  - title: Applies
    name: Applies
    model: NoBrothersModel
    explore: events_NoBrothers
    type: single_value
    fields: [events_NoBrothers.sollicitatie]
    limit: 500
    column_limit: 50
    total: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Applies
    hidden_pivots: {}
    hidden_fields: []
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Date: events_NoBrothers.date_date
      Campaign: combine_data_nb.campaign_name
      JobBoard: events_NoBrothers.Jobboard_name
    row: 0
    col: 6
    width: 3
    height: 3
  - title: Total Spends
    name: Total Spends (2)
    model: NoBrothersModel
    explore: events_NoBrothers
    type: looker_line
    fields: [job_board_budget_amount.budget, events_NoBrothers.date_date]
    fill_fields: [events_NoBrothers.date_date]
    filters:
      events_NoBrothers.campaign_name: ''
    sorts: [job_board_budget_amount.budget desc]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: "(${total_spend})"
      label: Total Budget
      value_format:
      value_format_name: eur
      _kind_hint: measure
      table_calculation: total_budget
      _type_hint: number
    - category: table_calculation
      expression: "${job_board_budget_amount.budget}/${number_of_days}"
      label: Total Spend
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: total_spend
      _type_hint: number
    - category: table_calculation
      expression: extract_days(add_days(-1, date(extract_years(add_months(1, ${events_NoBrothers.date_date})),
        extract_months(add_months(1, ${events_NoBrothers.date_date})), 1)))
      label: number_of_days
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: number_of_days
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Total Spends, orientation: left, series: [{axisId: total_budget,
            id: total_budget, name: Total Budget}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total Spends
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [job_board_budget_amount.budget, total_spend, number_of_days]
    listen:
      Date: events_NoBrothers.date_date
      Campaign: campaign.name
      JobBoard: jobboard.job_name
    row: 13
    col: 5
    width: 13
    height: 4
  - title: Applies
    name: Applies (2)
    model: NoBrothersModel
    explore: events_NoBrothers
    type: single_value
    fields: [job_board_budget_amount.budget, events_NoBrothers.date_date]
    fill_fields: [events_NoBrothers.date_date]
    filters:
      events_NoBrothers.campaign_name: ''
    sorts: [job_board_budget_amount.budget desc]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: sum(${total_spend})
      label: Total Budget
      value_format:
      value_format_name: eur
      _kind_hint: measure
      table_calculation: total_budget
      _type_hint: number
    - category: table_calculation
      expression: "${job_board_budget_amount.budget}/${number_of_days}"
      label: Total Spend
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: total_spend
      _type_hint: number
    - category: table_calculation
      expression: extract_days(add_days(-1, date(extract_years(add_months(1, ${events_NoBrothers.date_date})),
        extract_months(add_months(1, ${events_NoBrothers.date_date})), 1)))
      label: number_of_days
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: number_of_days
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total Spends
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Sollicitaties, orientation: left, series: [{axisId: events_NoBrothers.sollitatie,
            id: events_NoBrothers.sollitatie, name: Sollitatie}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Date
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [job_board_budget_amount.budget, total_spend, number_of_days]
    listen:
      Date: events_NoBrothers.date_date
      Campaign: campaign.name
      JobBoard: jobboard.job_name
    row: 0
    col: 9
    width: 3
    height: 3
  - name: Conv Rate (2)
    title: Conv Rate
    merged_queries:
    - model: NoBrothersModel
      explore: events_NoBrothers
      type: table
      fields: [events_NoBrothers.date_date, events_NoBrothers.total_clicks]
      fill_fields: [events_NoBrothers.date_date]
      sorts: [events_NoBrothers.date_date desc]
      limit: 500
      column_limit: 50
      hidden_pivots: {}
    - model: NoBrothersModel
      explore: events_NoBrothers
      type: table
      fields: [events_NoBrothers.date_date, events_NoBrothers.sollicitatie]
      fill_fields: [events_NoBrothers.date_date]
      sorts: [events_NoBrothers.date_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: "${job_board_budget_amount.budget}/30"
        label: Total Spend
        value_format:
        value_format_name:
        _kind_hint: measure
        table_calculation: total_spend
        _type_hint: number
        is_disabled: true
      hidden_pivots: {}
      join_fields:
      - field_name: events_NoBrothers.date_date
        source_field_name: events_NoBrothers.date_date
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Conv Rate
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: looker_line
    series_types: {}
    hidden_fields: [spends, number_of_days, events_NoBrothers.sollicitatie, events_NoBrothers.total_clicks]
    hidden_pivots: {}
    dynamic_fields:
    - category: table_calculation
      expression: "(${events_NoBrothers.sollicitatie})/(${events_NoBrothers.total_clicks})"
      label: Conv Rate
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: conv_rate
      _type_hint: number
    listen:
    - Date: events_NoBrothers.date_date
      Campaign: events_NoBrothers.campaign_name_clicks
      JobBoard: events_NoBrothers.UTM_SOURCE_Clicks
    - Date: events_NoBrothers.date_date
      Campaign: combine_data_nb.campaign_name
      JobBoard: events_NoBrothers.Jobboard_name
    row: 17
    col: 5
    width: 13
    height: 4
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: NoBrothersModel
    explore: events_NoBrothers
    listens_to_filters: []
    field: events_NoBrothers.date_date
  - name: Campaign
    title: Campaign
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: NoBrothersModel
    explore: events_NoBrothers
    listens_to_filters: []
    field: campaign.name
  - name: JobBoard
    title: JobBoard
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: NoBrothersModel
    explore: events_NoBrothers
    listens_to_filters: [Campaign]
    field: jobboard.job_name
