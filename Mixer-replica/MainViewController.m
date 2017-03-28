//
//  MainViewController.m
//  Mixer-replica
//
//  Created by Sergey Roslyakov on 3/24/17.
//  Copyright © 2017 Sunrise. All rights reserved.
//

#import "MainViewController.h"
#import "MainPageController.h"
#import "FavouritePageController.h"
//#import "Colors.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	[self setupTabBarAndNavigation];
	[self setTabBarAppearance];
}

- (void) setupTabBarAndNavigation {
	UITabBarController *tabBarController = [UITabBarController new];
	
	[tabBarController setViewControllers:@[
										   [self loadMainPageControler],
										   [self loadFavouritePageControler]
										   ]];
	
	UINavigationController *navController =
		[[UINavigationController alloc] initWithRootViewController:tabBarController];
	
	[self addChildViewController:navController];
	[self.view addSubview:navController.view];
	
}

- (UIViewController *) loadMainPageControler {
	
	UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainPage" bundle:nil];
	MainPageController *mainPageController = [sb instantiateInitialViewController];
	[mainPageController setTitle:@"Главная"];// .title = @"Главная";
	[mainPageController.tabBarItem setImage:[UIImage imageNamed:@"homeTab"]];
	[mainPageController.tabBarItem setSelectedImage:[UIImage imageNamed:@"homeTabSelected"]];
	return mainPageController;
}

- (UIViewController *) loadFavouritePageControler {
	
	UIStoryboard *sb = [UIStoryboard storyboardWithName:@"FavouritePage" bundle:nil];
	FavouritePageController *favouritePageController = [sb instantiateInitialViewController];
	 favouritePageController.title = @"Избранное";
	[favouritePageController.tabBarItem setImage:[UIImage imageNamed:@"favouriteTab"]];
	[favouritePageController.tabBarItem setSelectedImage:[UIImage imageNamed:@"favouriteTabSelected"]];
	return favouritePageController;
}

#pragma mark - appearance

- (void) setTabBarAppearance {
	//Цвет таббара
	UIColor *tabBarColor = [Colors colorRed:245
									  green:245
									   blue:245];

	
	//Установим цвет таббара
	[[UITabBar appearance] setBarTintColor:tabBarColor];
	
	//Цвет не выделенного текста
	UIColor *normalColor = [UIColor colorWithRed:100/255.0f
										   green:100/255.0f
											blue:100/255.0f
										   alpha:0.8f];
	
	//Создаем аттрибуты для невыделенной кнопки
	NSDictionary *normalAttributes =
	[NSDictionary dictionaryWithObjectsAndKeys: normalColor, NSForegroundColorAttributeName, nil];
	
	
	//Присваиваем аттрибуты для невыделенной кнопки
	[[UITabBarItem appearance]setTitleTextAttributes:normalAttributes
											forState:UIControlStateNormal];
	
	//Цвет выделенного текста
	UIColor *selectedColor = [UIColor colorWithRed:1/255.0f
											 green:1/255.0f
											  blue:1/255.0f
											 alpha:0.8f];
	//Создаем аттрибуты для выделенной кнопки
	NSDictionary *selectedAttributes =
	[NSDictionary dictionaryWithObjectsAndKeys: selectedColor, NSForegroundColorAttributeName, nil];
	
	//Присваивем аттрибуты для выделенной кнопки
	[[UITabBarItem appearance] setTitleTextAttributes:selectedAttributes										 forState:UIControlStateSelected];

}



@end
