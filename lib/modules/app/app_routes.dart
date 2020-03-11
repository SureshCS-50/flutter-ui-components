import 'package:flutter/material.dart';
import 'package:flutter_ui_components/constants.dart';
import 'package:flutter_ui_components/modules/about/about.dart';
import 'package:flutter_ui_components/modules/appbar/backdrop.dart';
import 'package:flutter_ui_components/modules/appbar/basic_appbar.dart';
import 'package:flutter_ui_components/modules/appbar/bottom_appbar.dart';
import 'package:flutter_ui_components/modules/appbar/search.dart';
import 'package:flutter_ui_components/modules/appbar/sliver_appbar.dart';
import 'package:flutter_ui_components/modules/home/home_page.dart';
import 'package:flutter_ui_components/modules/layouts/container_padding_center.dart';
import 'package:flutter_ui_components/modules/layouts/expanded.dart';
import 'package:flutter_ui_components/modules/layouts/row_col.dart';
import 'package:flutter_ui_components/modules/layouts/stack.dart';
import 'package:flutter_ui_components/modules/layouts/wrap.dart';
import 'package:flutter_ui_components/modules/lists/datatable.dart';
import 'package:flutter_ui_components/modules/lists/expansion_tile.dart';
import 'package:flutter_ui_components/modules/lists/grid_view.dart';
import 'package:flutter_ui_components/modules/lists/list_tile.dart';
import 'package:flutter_ui_components/modules/lists/listview_builder.dart';
import 'package:flutter_ui_components/modules/lists/reorderable.dart';
import 'package:flutter_ui_components/modules/lists/swipe_to_dismiss.dart';
import 'package:flutter_ui_components/modules/navigations/bottom_navbar.dart';
import 'package:flutter_ui_components/modules/navigations/bottom_sheet.dart';
import 'package:flutter_ui_components/modules/navigations/bottom_tabbar.dart';
import 'package:flutter_ui_components/modules/navigations/dialogs.dart';
import 'package:flutter_ui_components/modules/navigations/nav_drawer_header.dart';
import 'package:flutter_ui_components/modules/navigations/pageselector.dart';
import 'package:flutter_ui_components/modules/navigations/nav_routes.dart';
import 'package:flutter_ui_components/modules/navigations/tabs_layouts.dart';
import 'package:flutter_ui_components/modules/widgets/buttons.dart';
import 'package:flutter_ui_components/modules/widgets/card.dart';
import 'package:flutter_ui_components/modules/widgets/dropdown_button.dart';
import 'package:flutter_ui_components/modules/widgets/icon.dart';
import 'package:flutter_ui_components/modules/widgets/image.dart';
import 'package:flutter_ui_components/modules/widgets/stateful_widgets.dart';
import 'package:flutter_ui_components/modules/widgets/text.dart';
import 'package:flutter_ui_components/modules/widgets/textfield.dart';
import 'package:flutter_ui_components/modules/widgets/textformfield.dart';
import 'package:flutter_ui_components/routes/ui_route.dart';


const homeRoute = UIRoute(
  child: MyHomePage(),
  sourceFilePath: 'lib/modules/home/home_page.dart',
  title: APP_NAME,
  routeName: Navigator.defaultRouteName,
);

const aboutRoute = UIRoute(
  child: MyAboutRoute(),
  sourceFilePath: 'lib/modules/about/about.dart',
  title: 'About',
);


class UIRouteGroup {
  const UIRouteGroup(
      {@required this.groupName, @required this.icon, @required this.routes});
  final String groupName;
  final Widget icon;
  final List<UIRoute> routes;
}

const appRoutesBasic = <UIRouteGroup>[
  UIRouteGroup(
    groupName: 'Widgets',
    icon: Icon(Icons.extension),
    routes: <UIRoute>[
      UIRoute(
        child: IconExample(),
        sourceFilePath: 'lib/modules/widgets/icon.dart',
        title: 'Icon',
      ),
      UIRoute(
        child: TextExample(),
        sourceFilePath: 'lib/modules/widgets/text.dart',
        title: 'Text',
      ),
      UIRoute(
        child: TextFieldExample(),
        sourceFilePath: 'lib/modules/widgets/textfield.dart',
        title: 'TextField',
      ),
      UIRoute(
        child: TextFormFieldExample(),
        sourceFilePath: 'lib/modules/widgets/textformfield.dart',
        title: 'TextFormField',
        description: 'TextField in a FormField'
      ),
      UIRoute(
        child: ImageExample(),
        sourceFilePath: 'lib/modules/widgets/image.dart',
        title: 'Image'
      ),
      UIRoute(
        child: CardExample(),
        sourceFilePath: 'lib/modules/widgets/card.dart',
        title: 'Card, Inkwell',
        description:
            'Container with corner and shadow; inkwell (ripple) effects'
      ),
      UIRoute(
        child: ButtonsExample(),
        sourceFilePath: 'lib/modules/widgets/buttons.dart',
        title: 'Buttons',
        description:
            'RaisedButton, FlatButton, OutlineButton, IconButton&Tooltips'
      ),
      UIRoute(
        child: DropdownButtonExample(),
        sourceFilePath: 'lib/modules/widgets/dropdown_button.dart',
        title: 'DropdownButton, MenuButton'
      ),
      UIRoute(
        child: StatefulWidgetsExample(),
        sourceFilePath: 'lib/modules/widgets/stateful_widgets.dart',
        title: 'Other stateful widgets',
        description: 'Switch, CheckBox, Slider, etc.',
      ),
    ],
  ),
  UIRouteGroup(
    groupName: 'Layouts',
    icon: Icon(Icons.dashboard),
    routes: <UIRoute>[
      UIRoute(
        child: ContainerExample(),
        sourceFilePath: 'lib/modules/layouts/container_padding_center.dart',
        title: 'Container',
        description: 'Basic widgets for layout.'
      ),
      UIRoute(
        child: RowColExample(),
        sourceFilePath: 'lib/modules/layouts/row_col.dart',
        title: 'Row, Column',
        description: 'Aligns chidren widgets'
      ),
      UIRoute(
        child: WrapExample(),
        sourceFilePath: 'lib/modules/layouts/wrap.dart',
        title: 'Wrap'
      ),
      UIRoute(
        child: ExpandedExample(),
        sourceFilePath: 'lib/modules/layouts/expanded.dart',
        title: 'Expanded, SizedBox',
        description: 'Dividing space by "android:weight" (flex).'
      ),
      UIRoute(
        child: StackExample(),
        sourceFilePath: 'lib/modules/layouts/stack.dart',
        title: 'Stack',
        description: 'Like FrameLayouts in Android'
      ),
    ],
  ),
  UIRouteGroup(
    groupName: 'Lists',
    icon: Icon(Icons.format_list_numbered),
    routes: <UIRoute>[
      UIRoute(
        child: ListTileExample(),
        sourceFilePath: 'lib/modules/lists/list_tile.dart',
        title: 'ListTile'
      ),
      UIRoute(
        child: ListViewBuilderExample(),
        sourceFilePath: 'lib/modules/lists/listview_builder.dart',
        title: 'ListView.builder',
        description: 'Building list items with a builder.'
      ),
      UIRoute(
        child: GridListExample(),
        sourceFilePath: 'lib/modules/lists/grid_view.dart',
        title: 'GridList'
      ),
      UIRoute(
        child: ExpansionTileExample(),
        sourceFilePath: 'lib/modules/lists/expansion_tile.dart',
        title: 'ExpansionTile'
      ),
      UIRoute(
        child: ListSwipeToDismissExample(),
        sourceFilePath: 'lib/modules/lists/swipe_to_dismiss.dart',
        title: 'Swipe to dismiss'
      ),
      UIRoute(
        child: ReorderableListExample(),
        sourceFilePath: 'lib/modules/lists/reorderable.dart',
        title: 'Reorderable list'
      ),
      UIRoute(
        child: DataTableExample(),
        sourceFilePath: 'lib/modules/lists/datatable.dart',
        title: 'DataTable',
        description: 'Showing data in a table.'
      ),
    ],
  ),
  UIRouteGroup(
    groupName: 'Appbar',
    icon: RotatedBox(
      child: Icon(Icons.video_label),
      quarterTurns: 2,
    ),
    routes: <UIRoute>[
      UIRoute(
        child: BasicAppbarExample(),
        sourceFilePath: 'lib/modules/appbar/basic_appbar.dart',
        title: 'Basic AppBar'
      ),
      UIRoute(
        child: BottomAppbarExample(),
        sourceFilePath: 'lib/modules/appbar/bottom_appbar.dart',
        title: 'Bottom AppBar and Floating Button'
      ),
      UIRoute(
        child: AppBarSearchExample(),
        sourceFilePath: 'lib/modules/appbar/search.dart',
        title: 'Search'
      ),
      UIRoute(
        child: BackdropExample(),
        sourceFilePath: 'lib/modules/appbar/backdrop.dart',
        title: 'Backdrop',
        description: 'Switching between front and back layer. - like LP Homework widget'
      ),
    ],
  ),
  UIRouteGroup(
    groupName: 'Navigation',
    icon: Icon(Icons.view_carousel),
    routes: <UIRoute>[
      UIRoute(
        child: TabsExample(),
        sourceFilePath: 'lib/modules/navigations/tabs_layouts.dart',
        title: 'Tabs'
      ),
      UIRoute(
        child: DialogsExample(),
        sourceFilePath: 'lib/modules/navigations/dialogs.dart',
        title: 'Dialogs',
      ),
      UIRoute(
        child: RoutesExample(),
        sourceFilePath: 'lib/modules/navigations/nav_routes.dart',
        title: 'Routes'
      ),
      UIRoute(
        child: NavDrawerExample(),
        sourceFilePath: 'lib/modules/navigations/nav_drawer_header.dart',
        title: 'Navigation Drawer'
      ),
      UIRoute(
        child: BottomSheetExample(),
        sourceFilePath: 'lib/modules/navigations/bottom_sheet.dart',
        title: 'Bottom sheet'
      ),
      UIRoute(
        child: BottomTabBarExample(),
        sourceFilePath: 'lib/modules/navigations/bottom_tabbar.dart',
        title: 'Bottom tab bar',
      ),
      UIRoute(
        child: BottomNavigationBarExample(),
        sourceFilePath: 'lib/modules/navigations/bottom_navbar.dart',
        title: 'Bottom navigation bar'
      ),
      UIRoute(
        child: PageSelectorExample(),
        sourceFilePath: 'lib/modules/navigations/pageselector.dart',
        title: 'Page selector',
        description: 'Like Android ViewPager Component'

      ),
    ],
  ),
];


final allRoutes = <UIRoute>[
  ...appRoutesBasic.expand((group) => group.routes),
];

// routing table.
final Map<String, WidgetBuilder> router = {
  Navigator.defaultRouteName: (context) => homeRoute,
  aboutRoute.routeName: (context) => aboutRoute,
  for (UIRoute route in allRoutes) route.routeName: (context) => route,
};
