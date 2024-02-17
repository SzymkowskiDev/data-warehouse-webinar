import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

## @params: [JOB_NAME]
args = getResolvedOptions(sys.argv, ['JOB_NAME'])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

## Define the source database and table
database_name = "retail_app_db"
table_name = "markets"

## Define the S3 bucket and folder to save the data
s3_bucket = "staging-area-webinar-rap"
s3_folder = "initial_load"

## Read data from the source database
datasource = glueContext.create_dynamic_frame.from_catalog(database=database_name, table_name=table_name)

## Convert the DynamicFrame to DataFrame for further processing if needed
dataframe = datasource.toDF()

## Write the DataFrame to S3 in CSV format
dataframe.write.csv("s3://{}/{}".format(s3_bucket, s3_folder), header=True, mode="overwrite")

job.commit()
