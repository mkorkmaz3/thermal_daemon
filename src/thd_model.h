/*
 * thd_model.h: thermal model class interface
 *
 * Copyright (C) 2012 Intel Corporation. All rights reserved.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License version
 * 2 as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301, USA.
 *
 *
 * Author Name <Srinivas.Pandruvada@linux.intel.com>
 *
 */

#include "thermald.h"
#include <vector>

class cthd_model
{

private:
	static const int def_max_temperature = 100 * 1000;
	static const unsigned int safety_margin = 0; //1*1000;
	static const int angle_increment = 2;
	static const int def_setpoint_delay_cnt = 3;
	static const unsigned int max_compensation = 5000;
	static const unsigned int hot_zone_percent = 20; //20%


	unsigned int max_temp;
	unsigned int hot_zone;
	unsigned int last_temp;

	time_t trend_increase_start;
	time_t trend_decrease_start;
	time_t max_temp_reached;

	unsigned int set_point;

	int current_angle;
	int delay_cnt;
	bool max_temp_seen;
	bool set_point_reached;
	bool updated_set_point;

	unsigned int update_set_point();
	void store_set_point();
	unsigned int read_set_point();

public:
	cthd_model();

	void add_sample(unsigned int temperature);
	void set_max_temperature(unsigned int temp);
	unsigned int get_set_point()
	{
		return set_point;
	}
	bool is_set_point_reached()
	{
		return (set_point_reached || updated_set_point);
	};
};
