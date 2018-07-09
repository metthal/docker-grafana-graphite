#!/bin/bash

export_objects() {
	object_type=$1

	for file in ${object_type}/*.json; do
		filename=$(basename "${file}")
		slag="${filename%.*}"

		# Export only those objects which do not exist in Grafana already
		if [ ! -f ${EXISTING}/${object_type}/${filename} ]; then
			wizzy export ${object_type} ${slag}
		fi
	done
}

EXISTING=tmp

rm -rf ${EXISTING}           &&\
mkdir -p ${EXISTING}         &&\
cp -r conf ${EXISTING}/conf  &&\
pushd ${EXISTING}            &&\
# sleeping for 10 seconds to let grafana get up and running
sleep 10                     &&\
wizzy import dashboards      &&\
popd                         &&\
export_objects datasources   &&\
export_objects dashboards
