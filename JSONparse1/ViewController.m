//
//  ViewController.m
//  JSONparse1
//
//  Created by Rahul Morade on 17/05/14.
//  Copyright (c) 2014 Rahul Morade. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



- (IBAction)btnclicked:(id)sender {
    
    [self callservice];
}


- (void)callservice;

{
    
   NSString *str = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?q=%@&Units=metric", self.txtfd.text];
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:str]];
    
    [request setHTTPMethod:@"GET"];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    databuffer = [[NSMutableData alloc]init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [databuffer appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    NSDictionary * jsonObject = [NSJSONSerialization JSONObjectWithData:databuffer options:-1 error:nil];
    
    NSNumber * temp  =  jsonObject[@"main"][@"temp"];
    NSNumber * wind  =  jsonObject[@"wind"][@"speed"];
    NSNumber * sunrise  =  jsonObject[@"sys"][@"sunrise"];
    NSNumber * sunset  =  jsonObject[@"sys"][@"sunset"];
    
    NSDate * sunriseDate = [NSDate dateWithTimeIntervalSince1970:sunrise.longValue];
    NSDate * sunsetDate = [NSDate dateWithTimeIntervalSince1970:sunset.longValue];
    
    self.temp.text = [@"Temperature:" stringByAppendingString:[temp description]];
    self.wind.text = [@"Wind:" stringByAppendingString:[wind description]];
    
    self.sunrise.text = [@"Sunrise:" stringByAppendingString:[sunriseDate description]];
    self.sunset.text = [@"Sunset:" stringByAppendingString:[sunsetDate description]];
    

}



@end
