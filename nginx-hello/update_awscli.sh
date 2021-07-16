curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64-2.0.30.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
which_aws=`which aws`
bin_dir=`dirname $which_aws`
install_dir=`ls -l $which_aws|sed 's/.*\>//'|sed 's/aws-cli.*/aws-cli/'`
echo sudo ./aws/install --bin-dir $bin_dir --install-dir $install_dir --update  && exit 1