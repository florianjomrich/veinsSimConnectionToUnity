# This file was created by configpm when Perl was built. Any changes
# made to this file will be lost the next time perl is built.

package Config;
use strict;
use warnings;
use vars '%Config';

sub bincompat_options {
    return split ' ', (Internals::V())[0];
}

sub non_bincompat_options {
    return split ' ', (Internals::V())[1];
}

sub compile_date {
    return (Internals::V())[2]
}

sub local_patches {
    my (undef, undef, undef, @patches) = Internals::V();
    return @patches;
}

sub _V {
    die "Perl lib was built for 'msys' but is being run on '$^O'"
        unless "msys" eq $^O;

    my ($bincompat, $non_bincompat, $date, @patches) = Internals::V();

    my $opts = join ' ', sort split ' ', "$bincompat $non_bincompat";

    # wrap at 76 columns.

    $opts =~ s/(?=.{53})(.{1,53}) /$1\n                        /mg;

    print Config::myconfig();
    print "\nCharacteristics of this binary (from libperl): \n";

    print "  Compile-time options: $opts\n";

    if (@patches) {
        print "  Locally applied patches:\n";
        print "\t$_\n" foreach @patches;
    }

    print "  Built under msys\n";

    print "  $date\n" if defined $date;

    my @env = map { "$_=\"$ENV{$_}\"" } sort grep {/^PERL/} keys %ENV;
push @env, "MSYS=\"$ENV{MSYS}\"" if $ENV{MSYS};

    if (@env) {
        print "  \%ENV:\n";
        print "    $_\n" foreach @env;
    }
    print "  \@INC:\n";
    print "    $_\n" foreach @INC;
}

sub header_files {
    return qw(EXTERN.h INTERN.h XSUB.h av.h config.h cop.h cv.h
              dosish.h embed.h embedvar.h form.h gv.h handy.h hv.h hv_func.h
              intrpvar.h iperlsys.h keywords.h mg.h nostdio.h op.h opcode.h
              pad.h parser.h patchlevel.h perl.h perlio.h perliol.h perlsdio.h
              perlvars.h perly.h pp.h pp_proto.h proto.h regcomp.h regexp.h
              regnodes.h scope.h sv.h thread.h time64.h unixish.h utf8.h
              util.h);
}

##
## This file was produced by running the Configure script. It holds all the
## definitions figured out by Configure. Should you modify one of these values,
## do not forget to propagate your changes by running "Configure -der". You may
## instead choose to run each of the .SH files by yourself, or "Configure -S".
##
#
## Package name      : perl5
## Source directory  : .
## Configuration time: Fri Nov  7 12:16:59 AST 2014
## Configured by     : alexey
## Target system     : msys_nt-6.1-wow64 cab8 2.0.0(0.28053) 2014-11-06 20:52 i686 msys 
#
#: Configure command line arguments.
#

our $summary = <<'!END!';
Summary of my $package (revision $revision $version_patchlevel_string) configuration:
  $git_commit_id_title $git_commit_id$git_ancestor_line
  Platform:
    osname=$osname, osvers=$osvers, archname=$archname
    uname='$myuname'
    config_args='$config_args'
    hint=$hint, useposix=$useposix, d_sigaction=$d_sigaction
    useithreads=$useithreads, usemultiplicity=$usemultiplicity
    use64bitint=$use64bitint, use64bitall=$use64bitall, uselongdouble=$uselongdouble
    usemymalloc=$usemymalloc, bincompat5005=undef
  Compiler:
    cc='$cc', ccflags ='$ccflags',
    optimize='$optimize',
    cppflags='$cppflags'
    ccversion='$ccversion', gccversion='$gccversion', gccosandvers='$gccosandvers'
    intsize=$intsize, longsize=$longsize, ptrsize=$ptrsize, doublesize=$doublesize, byteorder=$byteorder
    d_longlong=$d_longlong, longlongsize=$longlongsize, d_longdbl=$d_longdbl, longdblsize=$longdblsize
    ivtype='$ivtype', ivsize=$ivsize, nvtype='$nvtype', nvsize=$nvsize, Off_t='$lseektype', lseeksize=$lseeksize
    alignbytes=$alignbytes, prototype=$prototype
  Linker and Libraries:
    ld='$ld', ldflags ='$ldflags'
    libpth=$libpth
    libs=$libs
    perllibs=$perllibs
    libc=$libc, so=$so, useshrplib=$useshrplib, libperl=$libperl
    gnulibc_version='$gnulibc_version'
  Dynamic Linking:
    dlsrc=$dlsrc, dlext=$dlext, d_dlsymun=$d_dlsymun, ccdlflags='$ccdlflags'
    cccdlflags='$cccdlflags', lddlflags='$lddlflags'

!END!
my $summary_expanded;

sub myconfig {
    return $summary_expanded if $summary_expanded;
    ($summary_expanded = $summary) =~ s{\$(\w+)}
		 { 
			my $c;
			if ($1 eq 'git_ancestor_line') {
				if ($Config::Config{git_ancestor}) {
					$c= "\n  Ancestor: $Config::Config{git_ancestor}";
				} else {
					$c= "";
				}
			} else {
                     		$c = $Config::Config{$1}; 
			}
			defined($c) ? $c : 'undef' 
		}ge;
    $summary_expanded;
}

local *_ = \my $a;
$_ = <<'!END!';
Author=''
CONFIG='true'
Date='$Date'
Header=''
Id='$Id'
Locker=''
Log='$Log'
PATCHLEVEL='20'
PERL_API_REVISION='5'
PERL_API_SUBVERSION='0'
PERL_API_VERSION='20'
PERL_CONFIG_SH='true'
PERL_PATCHLEVEL=''
PERL_REVISION='5'
PERL_SUBVERSION='1'
PERL_VERSION='20'
RCSfile='$RCSfile'
Revision='$Revision'
SUBVERSION='1'
Source=''
State=''
_a='.a'
_exe='.exe'
_o='.o'
afs='false'
afsroot='/afs'
alignbytes='8'
ansi2knr=''
aphostname='/usr/bin/hostname'
api_revision='5'
api_subversion='0'
api_version='20'
api_versionstring='5.20.0'
ar='ar'
archlib='/usr/lib/perl5/core_perl'
archlibexp='/usr/lib/perl5/core_perl'
archname64='64int'
archname='i686-msys-thread-multi-64int'
archobjs='cygwin.o'
asctime_r_proto='REENTRANT_PROTO_B_SB'
awk='awk'
baserev='5.0'
bash=''
bin='/usr/bin'
bin_ELF='undef'
binexp='/usr/bin'
bison='bison'
bootstrap_charset='undef'
byacc='byacc'
byteorder='12345678'
c=''
castflags='0'
cat='cat'
cc='gcc'
cccdlflags=' '
ccdlflags=' '
ccflags='-DPERL_USE_SAFE_PUTENV -U__STRICT_ANSI__ -fwrapv -fno-strict-aliasing -pipe -fstack-protector'
ccflags_uselargefiles=''
ccname='gcc'
ccsymbols=''
ccversion=''
cf_by='alexey'
cf_email=''
cf_time='Fri Nov  7 12:16:59 AST 2014'
charbits='8'
charsize='1'
chgrp=''
chmod='chmod'
chown=''
clocktype='clock_t'
comm='comm'
compress=''
config_arg0='./Configure'
config_arg10='-Dvendorlib=/usr/share/perl5/vendor_perl'
config_arg11='-Dvendorarch=/usr/lib/perl5/vendor_perl'
config_arg12='-Dscriptdir=/usr/bin/core_perl'
config_arg13='-Dsitescript=/usr/bin/site_perl'
config_arg14='-Dvendorscript=/usr/bin/vendor_perl'
config_arg15='-Dinc_version_list=none'
config_arg16='-Dman1ext=1perl'
config_arg17='-Dman3ext=3perl'
config_arg18='-Darchname=-msys-threads'
config_arg19='-Dmyarchname=-msys'
config_arg1='-des'
config_arg20='-Dlibperl=msys-perl5_20.dll'
config_arg21='-Dlddlflags=-shared -pipe'
config_arg22='-Dldflags=-pipe'
config_arg23='-Dcc=gcc'
config_arg24='-Dld=g++'
config_arg2='-Dusethreads'
config_arg3='-Doptimize=-march=i686 -mtune=generic -O2 -pipe'
config_arg4='-Dprefix=/usr'
config_arg5='-Dvendorprefix=/usr'
config_arg6='-Dprivlib=/usr/share/perl5/core_perl'
config_arg7='-Darchlib=/usr/lib/perl5/core_perl'
config_arg8='-Dsitelib=/usr/share/perl5/site_perl'
config_arg9='-Dsitearch=/usr/lib/perl5/site_perl'
config_argc='24'
config_args='-des -Dusethreads -Doptimize=-march=i686 -mtune=generic -O2 -pipe -Dprefix=/usr -Dvendorprefix=/usr -Dprivlib=/usr/share/perl5/core_perl -Darchlib=/usr/lib/perl5/core_perl -Dsitelib=/usr/share/perl5/site_perl -Dsitearch=/usr/lib/perl5/site_perl -Dvendorlib=/usr/share/perl5/vendor_perl -Dvendorarch=/usr/lib/perl5/vendor_perl -Dscriptdir=/usr/bin/core_perl -Dsitescript=/usr/bin/site_perl -Dvendorscript=/usr/bin/vendor_perl -Dinc_version_list=none -Dman1ext=1perl -Dman3ext=3perl -Darchname=-msys-threads -Dmyarchname=-msys -Dlibperl=msys-perl5_20.dll -Dlddlflags=-shared -pipe -Dldflags=-pipe -Dcc=gcc -Dld=g++'
contains='grep'
cp='cp'
cpio=''
cpp='cpp'
cpp_stuff='42'
cppccsymbols='__MSYS__=1 unix=1'
cppflags='-DPERL_USE_SAFE_PUTENV -U__STRICT_ANSI__ -fwrapv -fno-strict-aliasing -pipe -fstack-protector'
cpplast='-'
cppminus='-'
cpprun='gcc  -E'
cppstdin='gcc  -E'
cppsymbols='BIG_ENDIAN=4321 LITTLE_ENDIAN=1234 _LONG_DOUBLE=long\ double __BIG_ENDIAN=4321 __CYGWIN__=1 __GNUC_MINOR__=9 __GNUC__=4 __LITTLE_ENDIAN=1234 __STDC__=1 __i386=1 __i386__=1 __i686=1 __i686__=1 __unix=1 __unix__=1 i386=1'
crypt_r_proto='0'
cryptlib=''
csh='csh'
ctermid_r_proto='0'
ctime_r_proto='REENTRANT_PROTO_B_SB'
d_Gconvert='sprintf((b),"%.*g",(n),(x))'
d_PRIEUldbl='define'
d_PRIFUldbl='define'
d_PRIGUldbl='define'
d_PRIXU64='define'
d_PRId64='define'
d_PRIeldbl='define'
d_PRIfldbl='define'
d_PRIgldbl='define'
d_PRIi64='define'
d_PRIo64='define'
d_PRIu64='define'
d_PRIx64='define'
d_SCNfldbl='define'
d__fwalk='undef'
d_access='define'
d_accessx='undef'
d_aintl='undef'
d_alarm='define'
d_archlib='define'
d_asctime64='undef'
d_asctime_r='define'
d_atolf='undef'
d_atoll='define'
d_attribute_deprecated='define'
d_attribute_format='define'
d_attribute_malloc='define'
d_attribute_nonnull='define'
d_attribute_noreturn='define'
d_attribute_pure='define'
d_attribute_unused='define'
d_attribute_warn_unused_result='define'
d_bcmp='define'
d_bcopy='define'
d_bsd='define'
d_bsdgetpgrp='undef'
d_bsdsetpgrp='undef'
d_builtin_choose_expr='define'
d_builtin_expect='define'
d_bzero='define'
d_c99_variadic_macros='define'
d_casti32='undef'
d_castneg='define'
d_charvspr='undef'
d_chown='define'
d_chroot='define'
d_chsize='undef'
d_class='undef'
d_clearenv='undef'
d_closedir='define'
d_cmsghdr_s='define'
d_const='define'
d_copysignl='undef'
d_cplusplus='undef'
d_crypt='define'
d_crypt_r='undef'
d_csh='define'
d_ctermid='define'
d_ctermid_r='undef'
d_ctime64='undef'
d_ctime_r='define'
d_cuserid='define'
d_dbl_dig='define'
d_dbminitproto='define'
d_difftime64='undef'
d_difftime='define'
d_dir_dd_fd='undef'
d_dirfd='define'
d_dirnamlen='undef'
d_dlerror='define'
d_dlopen='define'
d_dlsymun='undef'
d_dosuid='undef'
d_drand48_r='undef'
d_drand48proto='define'
d_dup2='define'
d_eaccess='define'
d_endgrent='define'
d_endgrent_r='undef'
d_endhent='define'
d_endhostent_r='undef'
d_endnent='undef'
d_endnetent_r='undef'
d_endpent='define'
d_endprotoent_r='undef'
d_endpwent='define'
d_endpwent_r='undef'
d_endsent='define'
d_endservent_r='undef'
d_eofnblk='define'
d_eunice='undef'
d_faststdio='define'
d_fchdir='define'
d_fchmod='define'
d_fchown='define'
d_fcntl='define'
d_fcntl_can_lock='define'
d_fd_macros='define'
d_fd_set='define'
d_fds_bits='define'
d_fgetpos='define'
d_finite='define'
d_finitel='undef'
d_flexfnam='define'
d_flock='define'
d_flockproto='define'
d_fork='define'
d_fp_class='undef'
d_fpathconf='define'
d_fpclass='undef'
d_fpclassify='undef'
d_fpclassl='undef'
d_fpos64_t='undef'
d_frexpl='undef'
d_fs_data_s='undef'
d_fseeko='define'
d_fsetpos='define'
d_fstatfs='define'
d_fstatvfs='define'
d_fsync='define'
d_ftello='define'
d_ftime='undef'
d_futimes='define'
d_gdbm_ndbm_h_uses_prototypes='undef'
d_gdbmndbm_h_uses_prototypes='undef'
d_getaddrinfo='define'
d_getcwd='define'
d_getespwnam='undef'
d_getfsstat='undef'
d_getgrent='define'
d_getgrent_r='undef'
d_getgrgid_r='define'
d_getgrnam_r='define'
d_getgrps='define'
d_gethbyaddr='define'
d_gethbyname='define'
d_gethent='undef'
d_gethname='define'
d_gethostbyaddr_r='undef'
d_gethostbyname_r='undef'
d_gethostent_r='undef'
d_gethostprotos='define'
d_getitimer='define'
d_getlogin='define'
d_getlogin_r='define'
d_getmnt='undef'
d_getmntent='define'
d_getnameinfo='define'
d_getnbyaddr='undef'
d_getnbyname='undef'
d_getnent='undef'
d_getnetbyaddr_r='undef'
d_getnetbyname_r='undef'
d_getnetent_r='undef'
d_getnetprotos='define'
d_getpagsz='define'
d_getpbyname='define'
d_getpbynumber='define'
d_getpent='define'
d_getpgid='define'
d_getpgrp2='undef'
d_getpgrp='define'
d_getppid='define'
d_getprior='define'
d_getprotobyname_r='undef'
d_getprotobynumber_r='undef'
d_getprotoent_r='undef'
d_getprotoprotos='define'
d_getprpwnam='undef'
d_getpwent='define'
d_getpwent_r='undef'
d_getpwnam_r='define'
d_getpwuid_r='define'
d_getsbyname='define'
d_getsbyport='define'
d_getsent='define'
d_getservbyname_r='undef'
d_getservbyport_r='undef'
d_getservent_r='undef'
d_getservprotos='define'
d_getspnam='undef'
d_getspnam_r='undef'
d_gettimeod='define'
d_gmtime64='undef'
d_gmtime_r='define'
d_gnulibc='undef'
d_grpasswd='define'
d_hasmntopt='undef'
d_htonl='define'
d_ilogbl='undef'
d_inc_version_list='undef'
d_index='undef'
d_inetaton='define'
d_inetntop='define'
d_inetpton='define'
d_int64_t='define'
d_ip_mreq='define'
d_ip_mreq_source='define'
d_ipv6_mreq='define'
d_ipv6_mreq_source='undef'
d_isascii='define'
d_isblank='define'
d_isfinite='undef'
d_isinf='define'
d_isnan='define'
d_isnanl='undef'
d_killpg='define'
d_lchown='define'
d_ldbl_dig='define'
d_libm_lib_version='undef'
d_libname_unique='undef'
d_link='define'
d_localtime64='undef'
d_localtime_r='define'
d_localtime_r_needs_tzset='undef'
d_locconv='define'
d_lockf='define'
d_longdbl='define'
d_longlong='define'
d_lseekproto='define'
d_lstat='define'
d_madvise='define'
d_malloc_good_size='undef'
d_malloc_size='undef'
d_mblen='define'
d_mbstowcs='define'
d_mbtowc='define'
d_memchr='define'
d_memcmp='define'
d_memcpy='define'
d_memmove='define'
d_memset='define'
d_mkdir='define'
d_mkdtemp='define'
d_mkfifo='define'
d_mkstemp='define'
d_mkstemps='define'
d_mktime64='undef'
d_mktime='define'
d_mmap='define'
d_modfl='undef'
d_modfl_pow32_bug='undef'
d_modflproto='undef'
d_mprotect='define'
d_msg='define'
d_msg_ctrunc='define'
d_msg_dontroute='define'
d_msg_oob='define'
d_msg_peek='define'
d_msg_proxy='undef'
d_msgctl='define'
d_msgget='define'
d_msghdr_s='define'
d_msgrcv='define'
d_msgsnd='define'
d_msync='define'
d_munmap='define'
d_mymalloc='undef'
d_ndbm='define'
d_ndbm_h_uses_prototypes='define'
d_nice='define'
d_nl_langinfo='define'
d_nv_preserves_uv='undef'
d_nv_zero_is_allbits_zero='define'
d_off64_t='undef'
d_old_pthread_create_joinable='undef'
d_oldpthreads='undef'
d_oldsock='undef'
d_open3='define'
d_pathconf='define'
d_pause='define'
d_perl_otherlibdirs='undef'
d_phostname='undef'
d_pipe='define'
d_poll='define'
d_portable='define'
d_prctl='undef'
d_prctl_set_name='undef'
d_printf_format_null='define'
d_procselfexe='undef'
d_pseudofork='undef'
d_pthread_atfork='define'
d_pthread_attr_setscope='undef'
d_pthread_yield='define'
d_pwage='undef'
d_pwchange='undef'
d_pwclass='undef'
d_pwcomment='define'
d_pwexpire='undef'
d_pwgecos='define'
d_pwpasswd='define'
d_pwquota='undef'
d_qgcvt='undef'
d_quad='define'
d_random_r='undef'
d_readdir64_r='undef'
d_readdir='define'
d_readdir_r='define'
d_readlink='undef'
d_readv='define'
d_recvmsg='define'
d_rename='define'
d_rewinddir='define'
d_rmdir='define'
d_safebcpy='undef'
d_safemcpy='undef'
d_sanemcmp='define'
d_sbrkproto='define'
d_scalbnl='undef'
d_sched_yield='define'
d_scm_rights='define'
d_seekdir='define'
d_select='define'
d_sem='define'
d_semctl='define'
d_semctl_semid_ds='define'
d_semctl_semun='define'
d_semget='define'
d_semop='define'
d_sendmsg='define'
d_setegid='define'
d_seteuid='define'
d_setgrent='define'
d_setgrent_r='undef'
d_setgrps='define'
d_sethent='define'
d_sethostent_r='undef'
d_setitimer='define'
d_setlinebuf='define'
d_setlocale='define'
d_setlocale_r='undef'
d_setnent='undef'
d_setnetent_r='undef'
d_setpent='define'
d_setpgid='define'
d_setpgrp2='undef'
d_setpgrp='define'
d_setprior='define'
d_setproctitle='undef'
d_setprotoent_r='undef'
d_setpwent='define'
d_setpwent_r='undef'
d_setregid='define'
d_setresgid='undef'
d_setresuid='undef'
d_setreuid='define'
d_setrgid='undef'
d_setruid='undef'
d_setsent='define'
d_setservent_r='undef'
d_setsid='define'
d_setvbuf='define'
d_shm='define'
d_shmat='define'
d_shmatprototype='define'
d_shmctl='define'
d_shmdt='define'
d_shmget='define'
d_sigaction='define'
d_signbit='define'
d_sigprocmask='define'
d_sigsetjmp='define'
d_sin6_scope_id='define'
d_sitearch='define'
d_snprintf='define'
d_sockaddr_in6='define'
d_sockaddr_sa_len='undef'
d_sockatmark='undef'
d_sockatmarkproto='undef'
d_socket='define'
d_socklen_t='define'
d_sockpair='define'
d_socks5_init='undef'
d_sprintf_returns_strlen='define'
d_sqrtl='undef'
d_srand48_r='undef'
d_srandom_r='undef'
d_sresgproto='undef'
d_sresuproto='undef'
d_statblks='define'
d_statfs_f_flags='undef'
d_statfs_s='define'
d_static_inline='define'
d_statvfs='define'
d_stdio_cnt_lval='define'
d_stdio_ptr_lval='define'
d_stdio_ptr_lval_nochange_cnt='define'
d_stdio_ptr_lval_sets_cnt='undef'
d_stdio_stream_array='undef'
d_stdiobase='define'
d_stdstdio='define'
d_strchr='define'
d_strcoll='define'
d_strctcpy='define'
d_strerrm='strerror(e)'
d_strerror='define'
d_strerror_r='define'
d_strftime='define'
d_strlcat='define'
d_strlcpy='define'
d_strtod='define'
d_strtol='define'
d_strtold='define'
d_strtoll='define'
d_strtoq='undef'
d_strtoul='define'
d_strtoull='define'
d_strtouq='undef'
d_strxfrm='define'
d_suidsafe='undef'
d_symlink='define'
d_syscall='undef'
d_syscallproto='undef'
d_sysconf='define'
d_sysernlst=''
d_syserrlst='undef'
d_system='define'
d_tcgetpgrp='define'
d_tcsetpgrp='define'
d_telldir='define'
d_telldirproto='define'
d_time='define'
d_timegm='define'
d_times='define'
d_tm_tm_gmtoff='define'
d_tm_tm_zone='define'
d_tmpnam_r='undef'
d_truncate='define'
d_ttyname_r='define'
d_tzname='undef'
d_u32align='define'
d_ualarm='define'
d_umask='define'
d_uname='define'
d_union_semun='undef'
d_unordered='undef'
d_unsetenv='define'
d_usleep='define'
d_usleepproto='define'
d_ustat='undef'
d_vendorarch='define'
d_vendorbin='define'
d_vendorlib='define'
d_vendorscript='define'
d_vfork='undef'
d_void_closedir='undef'
d_voidsig='define'
d_voidtty=''
d_volatile='define'
d_vprintf='define'
d_vsnprintf='define'
d_wait4='define'
d_waitpid='define'
d_wcstombs='define'
d_wctomb='define'
d_writev='define'
d_xenix='undef'
date='date'
db_hashtype='u_int32_t'
db_prefixtype='size_t'
db_version_major='5'
db_version_minor='3'
db_version_patch='28'
direntrytype='struct dirent'
dlext='dll'
dlsrc='dl_dlopen.xs'
doublesize='8'
drand01='Perl_drand48()'
drand48_r_proto='0'
dtrace=''
dynamic_ext='B Compress/Raw/Bzip2 Compress/Raw/Zlib Cwd DB_File Data/Dumper Devel/PPPort Devel/Peek Digest/MD5 Digest/SHA Encode Fcntl File/DosGlob File/Glob Filter/Util/Call GDBM_File Hash/Util Hash/Util/FieldHash I18N/Langinfo IO IPC/SysV List/Util MIME/Base64 Math/BigInt/FastCalc NDBM_File ODBM_File Opcode POSIX PerlIO/encoding PerlIO/mmap PerlIO/scalar PerlIO/via SDBM_File Socket Storable Sys/Hostname Sys/Syslog Tie/Hash/NamedCapture Time/HiRes Time/Piece Unicode/Collate Unicode/Normalize Win32 Win32API/File XS/APItest XS/Typemap arybase attributes mro re threads threads/shared'
eagain='EAGAIN'
ebcdic='undef'
echo='echo'
egrep='egrep'
emacs=''
endgrent_r_proto='0'
endhostent_r_proto='0'
endnetent_r_proto='0'
endprotoent_r_proto='0'
endpwent_r_proto='0'
endservent_r_proto='0'
eunicefix=':'
exe_ext='.exe'
expr='expr'
extensions='B Compress/Raw/Bzip2 Compress/Raw/Zlib Cwd DB_File Data/Dumper Devel/PPPort Devel/Peek Digest/MD5 Digest/SHA Encode Fcntl File/DosGlob File/Glob Filter/Util/Call GDBM_File Hash/Util Hash/Util/FieldHash I18N/Langinfo IO IPC/SysV List/Util MIME/Base64 Math/BigInt/FastCalc NDBM_File ODBM_File Opcode POSIX PerlIO/encoding PerlIO/mmap PerlIO/scalar PerlIO/via SDBM_File Socket Storable Sys/Hostname Sys/Syslog Tie/Hash/NamedCapture Time/HiRes Time/Piece Unicode/Collate Unicode/Normalize Win32 Win32API/File XS/APItest XS/Typemap arybase attributes mro re threads threads/shared Win32CORE Archive/Tar Attribute/Handlers AutoLoader B/Debug CGI CPAN CPAN/Meta CPAN/Meta/Requirements CPAN/Meta/YAML Carp Config/Perl/V Devel/SelfStubber Digest Dumpvalue Env Errno Exporter ExtUtils/CBuilder ExtUtils/Command ExtUtils/Constant ExtUtils/Install ExtUtils/MakeMaker ExtUtils/Manifest ExtUtils/Miniperl ExtUtils/ParseXS File/Fetch File/Find File/Path File/Temp FileCache Filter/Simple Getopt/Long HTTP/Tiny I18N/Collate I18N/LangTags IO/Compress IO/Socket/IP IO/Zlib IPC/Cmd IPC/Open3 JSON/PP Locale/Codes Locale/Maketext Locale/Maketext/Simple Math/BigInt Math/BigRat Math/Complex Memoize Module/Build Module/CoreList Module/Load Module/Load/Conditional Module/Loaded Module/Metadata NEXT Net/Ping Package/Constants Params/Check Parse/CPAN/Meta Perl/OSType PerlIO/via/QuotedPrint Pod/Checker Pod/Escapes Pod/Functions Pod/Html Pod/Parser Pod/Perldoc Pod/Simple Pod/Usage Safe Search/Dict SelfLoader Term/ANSIColor Term/Cap Term/Complete Term/ReadLine Test Test/Harness Test/Simple Text/Abbrev Text/Balanced Text/ParseWords Text/Tabs Thread/Queue Thread/Semaphore Tie/File Tie/Memoize Tie/RefHash Time/Local XSLoader autodie autouse base bignum constant encoding/warnings experimental if lib libnet parent perlfaq podlators version'
extern_C='extern'
extras=''
fflushNULL='define'
fflushall='undef'
find=''
firstmakefile='GNUmakefile'
flex=''
fpossize='8'
fpostype='fpos_t'
freetype='void'
from=':'
full_ar='/usr/bin/ar'
full_csh='/usr/bin/csh'
full_sed='/usr/bin/sed'
gccansipedantic=''
gccosandvers=''
gccversion='4.9.2'
getgrent_r_proto='0'
getgrgid_r_proto='REENTRANT_PROTO_I_TSBWR'
getgrnam_r_proto='REENTRANT_PROTO_I_CSBWR'
gethostbyaddr_r_proto='0'
gethostbyname_r_proto='0'
gethostent_r_proto='0'
getlogin_r_proto='REENTRANT_PROTO_I_BW'
getnetbyaddr_r_proto='0'
getnetbyname_r_proto='0'
getnetent_r_proto='0'
getprotobyname_r_proto='0'
getprotobynumber_r_proto='0'
getprotoent_r_proto='0'
getpwent_r_proto='0'
getpwnam_r_proto='REENTRANT_PROTO_I_CSBWR'
getpwuid_r_proto='REENTRANT_PROTO_I_TSBWR'
getservbyname_r_proto='0'
getservbyport_r_proto='0'
getservent_r_proto='0'
getspnam_r_proto='0'
gidformat='"lu"'
gidsign='1'
gidsize='4'
gidtype='gid_t'
glibpth='/usr/shlib  /lib /usr/lib /usr/lib/386 /lib/386 /usr/ccs/lib /usr/ucblib /usr/local/lib '
gmake='gmake'
gmtime_r_proto='REENTRANT_PROTO_S_TS'
gnulibc_version=''
grep='grep'
groupcat=''
groupstype='gid_t'
gzip='gzip'
h_fcntl='false'
h_sysfile='true'
hint='recommended'
hostcat='cat /etc/hosts'
hostgenerate=''
hostosname=''
hostperl=''
html1dir=' '
html1direxp=''
html3dir=' '
html3direxp=''
i16size='2'
i16type='short'
i32size='4'
i32type='long'
i64size='8'
i64type='long long'
i8size='1'
i8type='signed char'
i_arpainet='define'
i_assert='define'
i_bsdioctl=''
i_crypt='define'
i_db='define'
i_dbm='define'
i_dirent='define'
i_dlfcn='define'
i_fcntl='undef'
i_float='define'
i_fp='undef'
i_fp_class='undef'
i_gdbm='define'
i_gdbm_ndbm='undef'
i_gdbmndbm='undef'
i_grp='define'
i_ieeefp='define'
i_inttypes='define'
i_langinfo='define'
i_libutil='undef'
i_limits='define'
i_locale='define'
i_machcthr='undef'
i_malloc='define'
i_mallocmalloc='undef'
i_math='define'
i_memory='undef'
i_mntent='define'
i_ndbm='define'
i_netdb='define'
i_neterrno='undef'
i_netinettcp='define'
i_niin='define'
i_poll='define'
i_prot='undef'
i_pthread='define'
i_pwd='define'
i_rpcsvcdbm='undef'
i_sgtty='undef'
i_shadow='undef'
i_socks='undef'
i_stdarg='define'
i_stdbool='define'
i_stddef='define'
i_stdlib='define'
i_string='define'
i_sunmath='undef'
i_sysaccess='undef'
i_sysdir='define'
i_sysfile='define'
i_sysfilio='undef'
i_sysin='undef'
i_sysioctl='define'
i_syslog='define'
i_sysmman='define'
i_sysmode='undef'
i_sysmount='define'
i_sysndir='undef'
i_sysparam='define'
i_syspoll='define'
i_sysresrc='define'
i_syssecrt='undef'
i_sysselct='define'
i_syssockio='undef'
i_sysstat='define'
i_sysstatfs='define'
i_sysstatvfs='define'
i_systime='define'
i_systimek='undef'
i_systimes='define'
i_systypes='define'
i_sysuio='define'
i_sysun='define'
i_sysutsname='define'
i_sysvfs='define'
i_syswait='define'
i_termio='undef'
i_termios='define'
i_time='undef'
i_unistd='define'
i_ustat='undef'
i_utime='define'
i_values='undef'
i_varargs='undef'
i_varhdr='stdarg.h'
i_vfork='undef'
ignore_versioned_solibs=''
inc_version_list=' '
inc_version_list_init='0'
incpath=''
incpth='/usr/lib/gcc/i686-pc-msys/4.9.2/include /usr/lib/gcc/i686-pc-msys/4.9.2/include-fixed /usr/include /usr/lib/gcc/i686-pc-msys/4.9.2/../../../../include/w32api'
inews=''
initialinstalllocation='/usr/bin'
installarchlib='/usr/lib/perl5/core_perl'
installbin='/usr/bin'
installhtml1dir=''
installhtml3dir=''
installman1dir='/usr/share/man/man1'
installman3dir='/usr/share/man/man3'
installprefix='/usr'
installprefixexp='/usr'
installprivlib='/usr/share/perl5/core_perl'
installscript='/usr/bin/core_perl'
installsitearch='/usr/lib/perl5/site_perl'
installsitebin='/usr/bin'
installsitehtml1dir=''
installsitehtml3dir=''
installsitelib='/usr/share/perl5/site_perl'
installsiteman1dir='/usr/share/man/man1'
installsiteman3dir='/usr/share/man/man3'
installsitescript='/usr/bin/site_perl'
installstyle='lib/perl5'
installusrbinperl='undef'
installvendorarch='/usr/lib/perl5/vendor_perl'
installvendorbin='/usr/bin'
installvendorhtml1dir=''
installvendorhtml3dir=''
installvendorlib='/usr/share/perl5/vendor_perl'
installvendorman1dir='/usr/share/man/man1'
installvendorman3dir='/usr/share/man/man3'
installvendorscript='/usr/bin/vendor_perl'
intsize='4'
issymlink=''
ivdformat='"lld"'
ivsize='8'
ivtype='long long'
known_extensions='Archive/Tar Attribute/Handlers AutoLoader B B/Debug CGI CPAN CPAN/Meta CPAN/Meta/Requirements CPAN/Meta/YAML Carp Compress/Raw/Bzip2 Compress/Raw/Zlib Config/Perl/V Cwd DB_File Data/Dumper Devel/PPPort Devel/Peek Devel/SelfStubber Digest Digest/MD5 Digest/SHA Dumpvalue Encode Env Errno Exporter ExtUtils/CBuilder ExtUtils/Command ExtUtils/Constant ExtUtils/Install ExtUtils/MakeMaker ExtUtils/Manifest ExtUtils/Miniperl ExtUtils/ParseXS Fcntl File/DosGlob File/Fetch File/Find File/Glob File/Path File/Temp FileCache Filter/Simple Filter/Util/Call GDBM_File Getopt/Long HTTP/Tiny Hash/Util Hash/Util/FieldHash I18N/Collate I18N/LangTags I18N/Langinfo IO IO/Compress IO/Socket/IP IO/Zlib IPC/Cmd IPC/Open3 IPC/SysV JSON/PP List/Util Locale/Codes Locale/Maketext Locale/Maketext/Simple MIME/Base64 Math/BigInt Math/BigInt/FastCalc Math/BigRat Math/Complex Memoize Module/Build Module/CoreList Module/Load Module/Load/Conditional Module/Loaded Module/Metadata NDBM_File NEXT Net/Ping ODBM_File Opcode POSIX Package/Constants Params/Check Parse/CPAN/Meta Perl/OSType PerlIO/encoding PerlIO/mmap PerlIO/scalar PerlIO/via PerlIO/via/QuotedPrint Pod/Checker Pod/Escapes Pod/Functions Pod/Html Pod/Parser Pod/Perldoc Pod/Simple Pod/Usage SDBM_File Safe Search/Dict SelfLoader Socket Storable Sys/Hostname Sys/Syslog Term/ANSIColor Term/Cap Term/Complete Term/ReadLine Test Test/Harness Test/Simple Text/Abbrev Text/Balanced Text/ParseWords Text/Tabs Thread/Queue Thread/Semaphore Tie/File Tie/Hash/NamedCapture Tie/Memoize Tie/RefHash Time/HiRes Time/Local Time/Piece Unicode/Collate Unicode/Normalize VMS/DCLsym VMS/Filespec VMS/Stdio Win32 Win32API/File Win32CORE XS/APItest XS/Typemap XSLoader arybase attributes autodie autouse base bignum constant encoding/warnings experimental if lib libnet mro parent perlfaq podlators re threads threads/shared version '
ksh=''
ld='g++'
ld_can_script='undef'
lddlflags=' --shared -pipe -Wl,--enable-auto-import -Wl,--export-all-symbols -Wl,--enable-auto-image-base -fstack-protector'
ldflags='-pipe -Wl,--enable-auto-import -Wl,--export-all-symbols -Wl,--enable-auto-image-base -fstack-protector'
ldflags_uselargefiles=''
ldlibpthname='PATH'
less='less.exe'
lib_ext='.a'
libc='/usr/lib/libc.a'
libperl='msys-perl5_20.dll'
libpth='/usr/lib/gcc/i686-pc-msys/4.9.2/include-fixed /usr/lib /usr/lib/gcc/i686-pc-msys/4.9.2/../../../../include/w32api'
libs='-lgdbm -ldb -ldl -lcrypt -lgdbm_compat'
libsdirs=' /usr/lib'
libsfiles=' libgdbm.dll.a libdb.dll.a libdl.a libcrypt.dll.a libgdbm_compat.dll.a'
libsfound=' /usr/lib/libgdbm.dll.a /usr/lib/libdb.dll.a /usr/lib/libdl.a /usr/lib/libcrypt.dll.a /usr/lib/libgdbm_compat.dll.a'
libspath=' /usr/lib/gcc/i686-pc-msys/4.9.2/include-fixed /usr/lib /usr/lib/gcc/i686-pc-msys/4.9.2/../../../../include/w32api'
libswanted='   socket bind inet nsl nm ndbm gdbm dbm db malloc dl ld sun crypt sec cposix posix ucb bsd BSD    gdbm_compat'
libswanted_uselargefiles=''
line=''
lint=''
lkflags=''
ln='ln'
lns='/usr/bin/ln.exe -s'
localtime_r_proto='REENTRANT_PROTO_S_TS'
locincpth='/usr/local/include /opt/local/include /usr/gnu/include /opt/gnu/include /usr/GNU/include /opt/GNU/include'
loclibpth='/usr/local/lib /opt/local/lib /usr/gnu/lib /opt/gnu/lib /usr/GNU/lib /opt/GNU/lib'
longdblsize='12'
longlongsize='8'
longsize='4'
lp=''
lpr=''
ls='ls'
lseeksize='8'
lseektype='off_t'
mad='undef'
madlyh=''
madlyobj=''
madlysrc=''
mail=''
mailx=''
make='make'
make_set_make='#'
mallocobj=''
mallocsrc=''
malloctype='void *'
man1dir='/usr/share/man/man1'
man1direxp='/usr/share/man/man1'
man1ext='1p'
man3dir='/usr/share/man/man3'
man3direxp='/usr/share/man/man3'
man3ext='3pm'
mips_type=''
mistrustnm=''
mkdir='mkdir'
mmaptype='void *'
modetype='mode_t'
more='more'
multiarch='undef'
mv=''
myarchname='i686-msys'
mydomain='.nonet'
myhostname='cab8'
myuname='msys_nt-6.1-wow64 cab8 2.0.0(0.28053) 2014-11-06 20:52 i686 msys '
n='-n'
need_va_copy='undef'
netdb_hlen_type='int'
netdb_host_type='const char *'
netdb_name_type='const char *'
netdb_net_type='long'
nm='nm'
nm_opt='-p'
nm_so_opt=''
nonxs_ext='Archive/Tar Attribute/Handlers AutoLoader B/Debug CGI CPAN CPAN/Meta CPAN/Meta/Requirements CPAN/Meta/YAML Carp Config/Perl/V Devel/SelfStubber Digest Dumpvalue Env Errno Exporter ExtUtils/CBuilder ExtUtils/Command ExtUtils/Constant ExtUtils/Install ExtUtils/MakeMaker ExtUtils/Manifest ExtUtils/Miniperl ExtUtils/ParseXS File/Fetch File/Find File/Path File/Temp FileCache Filter/Simple Getopt/Long HTTP/Tiny I18N/Collate I18N/LangTags IO/Compress IO/Socket/IP IO/Zlib IPC/Cmd IPC/Open3 JSON/PP Locale/Codes Locale/Maketext Locale/Maketext/Simple Math/BigInt Math/BigRat Math/Complex Memoize Module/Build Module/CoreList Module/Load Module/Load/Conditional Module/Loaded Module/Metadata NEXT Net/Ping Package/Constants Params/Check Parse/CPAN/Meta Perl/OSType PerlIO/via/QuotedPrint Pod/Checker Pod/Escapes Pod/Functions Pod/Html Pod/Parser Pod/Perldoc Pod/Simple Pod/Usage Safe Search/Dict SelfLoader Term/ANSIColor Term/Cap Term/Complete Term/ReadLine Test Test/Harness Test/Simple Text/Abbrev Text/Balanced Text/ParseWords Text/Tabs Thread/Queue Thread/Semaphore Tie/File Tie/Memoize Tie/RefHash Time/Local XSLoader autodie autouse base bignum constant encoding/warnings experimental if lib libnet parent perlfaq podlators version'
nroff='nroff'
nvEUformat='"E"'
nvFUformat='"F"'
nvGUformat='"G"'
nv_overflows_integers_at='256.0*256.0*256.0*256.0*256.0*256.0*2.0*2.0*2.0*2.0*2.0'
nv_preserves_uv_bits='53'
nveformat='"e"'
nvfformat='"f"'
nvgformat='"g"'
nvsize='8'
nvtype='double'
o_nonblock='O_NONBLOCK'
obj_ext='.o'
old_pthread_create_joinable=''
optimize='-march=i686 -mtune=generic -O2 -pipe'
orderlib='false'
osname='msys'
osvers='2.0.0(0.28053)'
otherlibdirs=' '
package='perl5'
pager='/usr/bin/less.exe -R'
passcat=''
patchlevel='20'
path_sep=':'
perl5='/usr/bin/perl'
perl='perl'
perl_patchlevel=''
perl_static_inline='static __inline__'
perladmin=''
perllibs='-ldl -lcrypt'
perlpath='/usr/bin/perl'
pg='pg'
phostname='hostname'
pidtype='pid_t'
plibpth='/usr/lib'
pmake=''
pr=''
prefix='/usr'
prefixexp='/usr'
privlib='/usr/share/perl5/core_perl'
privlibexp='/usr/share/perl5/core_perl'
procselfexe=''
prototype='define'
ptrsize='4'
quadkind='3'
quadtype='long long'
randbits='48'
randfunc='Perl_drand48'
random_r_proto='0'
randseedtype='U32'
ranlib=':'
rd_nodata='-1'
readdir64_r_proto='0'
readdir_r_proto='REENTRANT_PROTO_I_TSR'
revision='5'
rm='rm'
rm_try='/usr/bin/rm -f try try.exe a.out .out try.[cho] try..o core core.try* try.core*'
rmail=''
run=''
runnm='true'
sGMTIME_max='2147483647'
sGMTIME_min='-2147483648'
sLOCALTIME_max='2147483647'
sLOCALTIME_min='-2147483648'
sPRIEUldbl='"LE"'
sPRIFUldbl='"LF"'
sPRIGUldbl='"LG"'
sPRIXU64='"llX"'
sPRId64='"lld"'
sPRIeldbl='"Le"'
sPRIfldbl='"Lf"'
sPRIgldbl='"Lg"'
sPRIi64='"lli"'
sPRIo64='"llo"'
sPRIu64='"llu"'
sPRIx64='"llx"'
sSCNfldbl='"Lf"'
sched_yield='sched_yield()'
scriptdir='/usr/bin/core_perl'
scriptdirexp='/usr/bin/core_perl'
sed='sed'
seedfunc='Perl_drand48_init'
selectminbits='32'
selecttype='fd_set *'
sendmail=''
setgrent_r_proto='0'
sethostent_r_proto='0'
setlocale_r_proto='0'
setnetent_r_proto='0'
setprotoent_r_proto='0'
setpwent_r_proto='0'
setservent_r_proto='0'
sh='/bin/sh'
shar=''
sharpbang='#!'
shmattype='void *'
shortsize='2'
shrpenv=''
shsharp='true'
sig_count='33'
sig_name='ZERO HUP INT QUIT ILL TRAP ABRT EMT FPE KILL BUS SEGV SYS PIPE ALRM TERM URG STOP TSTP CONT CHLD TTIN TTOU IO XCPU XFSZ VTALRM PROF WINCH LOST USR1 USR2 RTMAX CLD POLL PWR RTMIN '
sig_name_init='"ZERO", "HUP", "INT", "QUIT", "ILL", "TRAP", "ABRT", "EMT", "FPE", "KILL", "BUS", "SEGV", "SYS", "PIPE", "ALRM", "TERM", "URG", "STOP", "TSTP", "CONT", "CHLD", "TTIN", "TTOU", "IO", "XCPU", "XFSZ", "VTALRM", "PROF", "WINCH", "LOST", "USR1", "USR2", "RTMAX", "CLD", "POLL", "PWR", "RTMIN", 0'
sig_num='0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 20 23 29 32 '
sig_num_init='0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 20, 23, 29, 32, 0'
sig_size='37'
signal_t='void'
sitearch='/usr/lib/perl5/site_perl'
sitearchexp='/usr/lib/perl5/site_perl'
sitebin='/usr/bin'
sitebinexp='/usr/bin'
sitehtml1dir=''
sitehtml1direxp=''
sitehtml3dir=''
sitehtml3direxp=''
sitelib='/usr/share/perl5/site_perl'
sitelib_stem='/usr/share/perl5/site_perl'
sitelibexp='/usr/share/perl5/site_perl'
siteman1dir='/usr/share/man/man1'
siteman1direxp='/usr/share/man/man1'
siteman3dir='/usr/share/man/man3'
siteman3direxp='/usr/share/man/man3'
siteprefix='/usr'
siteprefixexp='/usr'
sitescript='/usr/bin/site_perl'
sitescriptexp='/usr/bin/site_perl'
sizesize='4'
sizetype='size_t'
sleep=''
smail=''
so='dll'
sockethdr=''
socketlib=''
socksizetype='socklen_t'
sort='sort'
spackage='Perl5'
spitshell='cat'
srand48_r_proto='0'
srandom_r_proto='0'
src='.'
ssizetype='ssize_t'
st_ino_sign='1'
st_ino_size='8'
startperl='#!/usr/bin/perl'
startsh='#!/bin/sh'
static_ext=' '
stdchar='char'
stdio_base='((fp)->_ub._base ? (fp)->_ub._base : (fp)->_bf._base)'
stdio_bufsiz='((fp)->_ub._base ? (fp)->_ub._size : (fp)->_bf._size)'
stdio_cnt='((fp)->_r)'
stdio_filbuf=''
stdio_ptr='((fp)->_p)'
stdio_stream_array=''
strerror_r_proto='REENTRANT_PROTO_I_IBW'
strings='/usr/include/string.h'
submit=''
subversion='1'
sysman='/usr/share/man/man1'
sysroot=''
tail=''
tar=''
targetarch=''
targetdir=''
targetenv=''
targethost=''
targetmkdir=''
targetport=''
targetsh='/bin/sh'
tbl=''
tee=''
test='test'
timeincl='/usr/include/sys/time.h '
timetype='time_t'
tmpnam_r_proto='0'
to=':'
touch='touch'
tr='tr'
trnl='\n'
troff=''
ttyname_r_proto='REENTRANT_PROTO_I_IBW'
u16size='2'
u16type='unsigned short'
u32size='4'
u32type='unsigned long'
u64size='8'
u64type='unsigned long long'
u8size='1'
u8type='unsigned char'
uidformat='"lu"'
uidsign='1'
uidsize='4'
uidtype='uid_t'
uname='uname'
uniq='uniq'
uquadtype='unsigned long long'
use5005threads='undef'
use64bitall='undef'
use64bitint='define'
usecrosscompile='undef'
usedevel='undef'
usedl='define'
usedtrace='undef'
usefaststdio='undef'
useithreads='define'
usekernprocpathname='undef'
uselargefiles='define'
uselongdouble='undef'
usemallocwrap='undef'
usemorebits='undef'
usemultiplicity='define'
usemymalloc='n'
usenm='true'
usensgetexecutablepath='undef'
useopcode='true'
useperlio='define'
useposix='true'
usereentrant='undef'
userelocatableinc='undef'
useshrplib='true'
usesitecustomize='undef'
usesocks='undef'
usethreads='define'
usevendorprefix='define'
useversionedarchname='undef'
usevfork='false'
usrinc='/usr/include'
uuname=''
uvXUformat='"llX"'
uvoformat='"llo"'
uvsize='8'
uvtype='unsigned long long'
uvuformat='"llu"'
uvxformat='"llx"'
vaproto='define'
vendorarch='/usr/lib/perl5/vendor_perl'
vendorarchexp='/usr/lib/perl5/vendor_perl'
vendorbin='/usr/bin'
vendorbinexp='/usr/bin'
vendorhtml1dir=' '
vendorhtml1direxp=''
vendorhtml3dir=' '
vendorhtml3direxp=''
vendorlib='/usr/share/perl5/vendor_perl'
vendorlib_stem='/usr/share/perl5/vendor_perl'
vendorlibexp='/usr/share/perl5/vendor_perl'
vendorman1dir='/usr/share/man/man1'
vendorman1direxp='/usr/share/man/man1'
vendorman3dir='/usr/share/man/man3'
vendorman3direxp='/usr/share/man/man3'
vendorprefix='/usr'
vendorprefixexp='/usr'
vendorscript='/usr/bin/vendor_perl'
vendorscriptexp='/usr/bin/vendor_perl'
version='5.20.1'
version_patchlevel_string='version 20 subversion 1'
versiononly='undef'
vi=''
xlibpth='/usr/lib/386 /lib/386'
yacc='yacc'
yaccflags=''
zcat=''
zip='zip'
!END!

my $i = ord(8);
foreach my $c (7,6,5,4,3,2,1) { $i <<= 8; $i |= ord($c); }
our $byteorder = join('', unpack('aaaaaaaa', pack('Q', $i)));
s/(byteorder=)(['"]).*?\2/$1$2$Config::byteorder$2/m;

my $config_sh_len = length $_;

our $Config_SH_expanded = "\n$_" . << 'EOVIRTUAL';
ccflags_nolargefiles='-DPERL_USE_SAFE_PUTENV -U__STRICT_ANSI__ -fwrapv -fno-strict-aliasing -pipe -fstack-protector'
ldflags_nolargefiles='-pipe -Wl,--enable-auto-import -Wl,--export-all-symbols -Wl,--enable-auto-image-base -fstack-protector'
libs_nolargefiles='-lgdbm -ldb -ldl -lcrypt -lgdbm_compat'
libswanted_nolargefiles='   socket bind inet nsl nm ndbm gdbm dbm db malloc dl ld sun crypt sec cposix posix ucb bsd BSD    gdbm_compat'
EOVIRTUAL
eval {
	# do not have hairy conniptions if this isnt available
	require 'Config_git.pl';
	$Config_SH_expanded .= $Config::Git_Data;
	1;
} or warn "Warning: failed to load Config_git.pl, something strange about this perl...\n";

# Search for it in the big string
sub fetch_string {
    my($self, $key) = @_;

    return undef unless $Config_SH_expanded =~ /\n$key=\'(.*?)\'\n/s;
    # So we can say "if $Config{'foo'}".
    $self->{$key} = $1 eq 'undef' ? undef : $1;
}

my $prevpos = 0;

sub FIRSTKEY {
    $prevpos = 0;
    substr($Config_SH_expanded, 1, index($Config_SH_expanded, '=') - 1 );
}

sub NEXTKEY {
    my $pos = index($Config_SH_expanded, qq('\n), $prevpos) + 2;
    my $len = index($Config_SH_expanded, "=", $pos) - $pos;
    $prevpos = $pos;
    $len > 0 ? substr($Config_SH_expanded, $pos, $len) : undef;
}

sub EXISTS {
    return 1 if exists($_[0]->{$_[1]});

    return(index($Config_SH_expanded, "\n$_[1]='") != -1
          );
}

sub STORE  { die "\%Config::Config is read-only\n" }
*DELETE = *CLEAR = \*STORE; # Typeglob aliasing uses less space

sub config_sh {
    substr $Config_SH_expanded, 1, $config_sh_len;
}

sub config_re {
    my $re = shift;
    return map { chomp; $_ } grep eval{ /^(?:$re)=/ }, split /^/,
    $Config_SH_expanded;
}

sub config_vars {
    # implements -V:cfgvar option (see perlrun -V:)
    foreach (@_) {
	# find optional leading, trailing colons; and query-spec
	my ($notag,$qry,$lncont) = m/^(:)?(.*?)(:)?$/;	# flags fore and aft, 
	# map colon-flags to print decorations
	my $prfx = $notag ? '': "$qry=";		# tag-prefix for print
	my $lnend = $lncont ? ' ' : ";\n";		# line ending for print

	# all config-vars are by definition \w only, any \W means regex
	if ($qry =~ /\W/) {
	    my @matches = config_re($qry);
	    print map "$_$lnend", @matches ? @matches : "$qry: not found"		if !$notag;
	    print map { s/\w+=//; "$_$lnend" } @matches ? @matches : "$qry: not found"	if  $notag;
	} else {
	    my $v = (exists $Config::Config{$qry}) ? $Config::Config{$qry}
						   : 'UNKNOWN';
	    $v = 'undef' unless defined $v;
	    print "${prfx}'${v}'$lnend";
	}
    }
}

# Called by the real AUTOLOAD
sub launcher {
    undef &AUTOLOAD;
    goto \&$Config::AUTOLOAD;
}

1;
