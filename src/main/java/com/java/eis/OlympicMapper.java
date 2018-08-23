package com.java.eis;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

import com.java.web.MRController;

public class OlympicMapper extends Mapper<LongWritable, Text, Text, IntWritable> {
	Text outputKey = new Text();
	final static IntWritable outputValue = new IntWritable(1);

	@Override
	protected void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
		MRBean mb = new MRBean(value);
		if(MRController.choice1.equals("나라")) {
			if(mb.getYear().equals(MRController.selectY)) {
				if(mb.getAthlete().equals(MRController.selectA)) {
					if(mb.getMedal().equals(MRController.selectM)) {
						outputKey.set(mb.getCountry() + "," +  mb.getMedal());
						context.write(outputKey, outputValue);
					}
				}
			}
		}else if(MRController.choice1.equals("종목")){
			if(mb.getYear().equals(MRController.selectY)) {
				if(mb.getCountry().equals(MRController.selectC)) {
					if(mb.getMedal().equals(MRController.selectM)) {
						outputKey.set(mb.getAthlete() + "," +  mb.getMedal());
						context.write(outputKey, outputValue);
					}
				}
			}
		}else if(MRController.choice1.equals("메달")){
			if(mb.getYear().equals(MRController.selectY)) {
				if(mb.getCountry().equals(MRController.selectC)) {
					if(mb.getAthlete().equals(MRController.selectA)) {
						outputKey.set(mb.getAthlete());
						context.write(outputKey, outputValue);
					}
				}
			}
		}
	}
}
