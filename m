Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BAA22381E
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 17 Jul 2020 11:20:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jwMXp-0003Ac-2R
	for lists+kgdb-bugreport@lfdr.de; Fri, 17 Jul 2020 09:20:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <lkp@intel.com>) id 1jwAor-0005dz-Rs
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 20:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e6MqCLU4L6+05qturd2RWs97j0l1gqlAmzR1HuMfZcs=; b=c7oF/zVzGRgxsPAnacWKO53QGT
 UjsgsK4jip/QgxzQQ4tukqDyrwuqz1xaC8YdnzWjulOFhskSIZemaRtoBYy13ChrNi10KW1lUvjWD
 fY6G1DlJ5gU31JBpulA3DjPlsItyJWv+KVHuZq5ZZnv+fEgaN5tiPJxJwobkSnnAQRC8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e6MqCLU4L6+05qturd2RWs97j0l1gqlAmzR1HuMfZcs=; b=FuYz6hE/VQFqaW52B+bwzCAFtL
 WIvx5/+7tDBQz57fmkidUdoaKPyvemyb2wBNpZUiZwpWJRroYUqs7buxWp+pwfggL/d5NbiTFa8Cc
 s7zwS9E0iE7TwXqG2yDoRTHfvvrkX3GM0U/MKxRV5eGtV9JNmEz9ItvqY4DjMcY86elE=;
Received: from mga12.intel.com ([192.55.52.136])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jwAon-006Vul-OW
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 20:49:29 +0000
IronPort-SDR: NkV4pTtS0772ubFgujhcLFpBcdu7Ur+mLEwhhQy3U+lfUS3Rjrqle3fyVDQk/7Eq+roNwXVb4z
 1OG9qAvdn4sA==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="129055850"
X-IronPort-AV: E=Sophos;i="5.75,360,1589266800"; 
 d="gz'50?scan'50,208,50";a="129055850"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 13:49:18 -0700
IronPort-SDR: AWkhP+W/oRiVRZkwkgOL+PvVORfhqw/NmKCh3LDAkHmfm5/+uKoHaMePirJ871iSOGDTsTyyUb
 MOQjCjyC+/Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,360,1589266800"; 
 d="gz'50?scan'50,208,50";a="361154100"
Received: from lkp-server01.sh.intel.com (HELO 70d1600e1569) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 16 Jul 2020 13:49:14 -0700
Received: from kbuild by 70d1600e1569 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jwAob-0000Bd-KS; Thu, 16 Jul 2020 20:49:13 +0000
Date: Fri, 17 Jul 2020 04:48:52 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Thompson <daniel.thompson@linaro.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Message-ID: <202007170416.HyFlooXO%lkp@intel.com>
References: <20200716151943.2167652-2-daniel.thompson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200716151943.2167652-2-daniel.thompson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jwAon-006Vul-OW
X-Mailman-Approved-At: Fri, 17 Jul 2020 09:20:32 +0000
Content-Disposition: inline
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Kgdb-bugreport] [PATCH v2 1/3] kgdb: Honour the kprobe
 blocklist when setting breakpoints
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, kbuild-all@lists.01.org,
 pmladek@suse.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, sergey.senozhatsky@gmail.com,
 Masami Hiramatsu <mhiramat@kernel.org>, will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Daniel,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on kgdb/kgdb-next pmladek/for-next v5.8-rc5 next-20200716]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Thompson/kgdb-Honour-the-kprobe-blacklist-when-setting-breakpoints/20200716-232506
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f8456690ba8eb18ea4714e68554e242a04f65cff
config: arm64-allyesconfig (attached as .config)
compiler: aarch64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arm64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/wireless/intel/ipw2x00/ipw2100.c:3794:16: error: conflicting types for 'show_registers'
    3794 | static ssize_t show_registers(struct device *d, struct device_attribute *attr,
         |                ^~~~~~~~~~~~~~
   In file included from include/linux/kgdb.h:19,
                    from arch/arm64/include/asm/cacheflush.h:11,
                    from include/linux/highmem.h:12,
                    from include/linux/pagemap.h:11,
                    from include/linux/blkdev.h:16,
                    from include/linux/blk-cgroup.h:23,
                    from include/linux/writeback.h:14,
                    from include/linux/memcontrol.h:22,
                    from include/net/sock.h:53,
                    from include/linux/tcp.h:19,
                    from drivers/net/wireless/intel/ipw2x00/ipw2100.c:144:
   include/linux/kprobes.h:230:13: note: previous declaration of 'show_registers' was here
     230 | extern void show_registers(struct pt_regs *regs);
         |             ^~~~~~~~~~~~~~

vim +/show_registers +3794 drivers/net/wireless/intel/ipw2x00/ipw2100.c

2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3558  
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3559  #define IPW2100_REG(x) { IPW_ ##x, #x }
c4aee8c21ff5d8d drivers/net/wireless/ipw2100.c               Jiri Benc        2005-08-25  3560  static const struct {
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3561  	u32 addr;
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3562  	const char *name;
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3563  } hw_data[] = {
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3564  IPW2100_REG(REG_GP_CNTRL),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3565  	    IPW2100_REG(REG_GPIO),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3566  	    IPW2100_REG(REG_INTA),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3567  	    IPW2100_REG(REG_INTA_MASK), IPW2100_REG(REG_RESET_REG),};
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3568  #define IPW2100_NIC(x, s) { x, #x, s }
c4aee8c21ff5d8d drivers/net/wireless/ipw2100.c               Jiri Benc        2005-08-25  3569  static const struct {
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3570  	u32 addr;
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3571  	const char *name;
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3572  	size_t size;
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3573  } nic_data[] = {
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3574  IPW2100_NIC(IPW2100_CONTROL_REG, 2),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3575  	    IPW2100_NIC(0x210014, 1), IPW2100_NIC(0x210000, 1),};
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3576  #define IPW2100_ORD(x, d) { IPW_ORD_ ##x, #x, d }
c4aee8c21ff5d8d drivers/net/wireless/ipw2100.c               Jiri Benc        2005-08-25  3577  static const struct {
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3578  	u8 index;
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3579  	const char *name;
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3580  	const char *desc;
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3581  } ord_data[] = {
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3582  IPW2100_ORD(STAT_TX_HOST_REQUESTS, "requested Host Tx's (MSDU)"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3583  	    IPW2100_ORD(STAT_TX_HOST_COMPLETE,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3584  				"successful Host Tx's (MSDU)"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3585  	    IPW2100_ORD(STAT_TX_DIR_DATA,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3586  				"successful Directed Tx's (MSDU)"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3587  	    IPW2100_ORD(STAT_TX_DIR_DATA1,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3588  				"successful Directed Tx's (MSDU) @ 1MB"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3589  	    IPW2100_ORD(STAT_TX_DIR_DATA2,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3590  				"successful Directed Tx's (MSDU) @ 2MB"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3591  	    IPW2100_ORD(STAT_TX_DIR_DATA5_5,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3592  				"successful Directed Tx's (MSDU) @ 5_5MB"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3593  	    IPW2100_ORD(STAT_TX_DIR_DATA11,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3594  				"successful Directed Tx's (MSDU) @ 11MB"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3595  	    IPW2100_ORD(STAT_TX_NODIR_DATA1,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3596  				"successful Non_Directed Tx's (MSDU) @ 1MB"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3597  	    IPW2100_ORD(STAT_TX_NODIR_DATA2,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3598  				"successful Non_Directed Tx's (MSDU) @ 2MB"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3599  	    IPW2100_ORD(STAT_TX_NODIR_DATA5_5,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3600  				"successful Non_Directed Tx's (MSDU) @ 5.5MB"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3601  	    IPW2100_ORD(STAT_TX_NODIR_DATA11,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3602  				"successful Non_Directed Tx's (MSDU) @ 11MB"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3603  	    IPW2100_ORD(STAT_NULL_DATA, "successful NULL data Tx's"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3604  	    IPW2100_ORD(STAT_TX_RTS, "successful Tx RTS"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3605  	    IPW2100_ORD(STAT_TX_CTS, "successful Tx CTS"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3606  	    IPW2100_ORD(STAT_TX_ACK, "successful Tx ACK"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3607  	    IPW2100_ORD(STAT_TX_ASSN, "successful Association Tx's"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3608  	    IPW2100_ORD(STAT_TX_ASSN_RESP,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3609  				"successful Association response Tx's"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3610  	    IPW2100_ORD(STAT_TX_REASSN,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3611  				"successful Reassociation Tx's"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3612  	    IPW2100_ORD(STAT_TX_REASSN_RESP,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3613  				"successful Reassociation response Tx's"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3614  	    IPW2100_ORD(STAT_TX_PROBE,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3615  				"probes successfully transmitted"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3616  	    IPW2100_ORD(STAT_TX_PROBE_RESP,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3617  				"probe responses successfully transmitted"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3618  	    IPW2100_ORD(STAT_TX_BEACON, "tx beacon"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3619  	    IPW2100_ORD(STAT_TX_ATIM, "Tx ATIM"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3620  	    IPW2100_ORD(STAT_TX_DISASSN,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3621  				"successful Disassociation TX"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3622  	    IPW2100_ORD(STAT_TX_AUTH, "successful Authentication Tx"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3623  	    IPW2100_ORD(STAT_TX_DEAUTH,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3624  				"successful Deauthentication TX"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3625  	    IPW2100_ORD(STAT_TX_TOTAL_BYTES,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3626  				"Total successful Tx data bytes"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3627  	    IPW2100_ORD(STAT_TX_RETRIES, "Tx retries"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3628  	    IPW2100_ORD(STAT_TX_RETRY1, "Tx retries at 1MBPS"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3629  	    IPW2100_ORD(STAT_TX_RETRY2, "Tx retries at 2MBPS"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3630  	    IPW2100_ORD(STAT_TX_RETRY5_5, "Tx retries at 5.5MBPS"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3631  	    IPW2100_ORD(STAT_TX_RETRY11, "Tx retries at 11MBPS"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3632  	    IPW2100_ORD(STAT_TX_FAILURES, "Tx Failures"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3633  	    IPW2100_ORD(STAT_TX_MAX_TRIES_IN_HOP,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3634  				"times max tries in a hop failed"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3635  	    IPW2100_ORD(STAT_TX_DISASSN_FAIL,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3636  				"times disassociation failed"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3637  	    IPW2100_ORD(STAT_TX_ERR_CTS, "missed/bad CTS frames"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3638  	    IPW2100_ORD(STAT_TX_ERR_ACK, "tx err due to acks"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3639  	    IPW2100_ORD(STAT_RX_HOST, "packets passed to host"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3640  	    IPW2100_ORD(STAT_RX_DIR_DATA, "directed packets"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3641  	    IPW2100_ORD(STAT_RX_DIR_DATA1, "directed packets at 1MB"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3642  	    IPW2100_ORD(STAT_RX_DIR_DATA2, "directed packets at 2MB"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3643  	    IPW2100_ORD(STAT_RX_DIR_DATA5_5,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3644  				"directed packets at 5.5MB"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3645  	    IPW2100_ORD(STAT_RX_DIR_DATA11, "directed packets at 11MB"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3646  	    IPW2100_ORD(STAT_RX_NODIR_DATA, "nondirected packets"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3647  	    IPW2100_ORD(STAT_RX_NODIR_DATA1,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3648  				"nondirected packets at 1MB"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3649  	    IPW2100_ORD(STAT_RX_NODIR_DATA2,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3650  				"nondirected packets at 2MB"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3651  	    IPW2100_ORD(STAT_RX_NODIR_DATA5_5,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3652  				"nondirected packets at 5.5MB"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3653  	    IPW2100_ORD(STAT_RX_NODIR_DATA11,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3654  				"nondirected packets at 11MB"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3655  	    IPW2100_ORD(STAT_RX_NULL_DATA, "null data rx's"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3656  	    IPW2100_ORD(STAT_RX_RTS, "Rx RTS"), IPW2100_ORD(STAT_RX_CTS,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3657  								    "Rx CTS"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3658  	    IPW2100_ORD(STAT_RX_ACK, "Rx ACK"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3659  	    IPW2100_ORD(STAT_RX_CFEND, "Rx CF End"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3660  	    IPW2100_ORD(STAT_RX_CFEND_ACK, "Rx CF End + CF Ack"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3661  	    IPW2100_ORD(STAT_RX_ASSN, "Association Rx's"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3662  	    IPW2100_ORD(STAT_RX_ASSN_RESP, "Association response Rx's"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3663  	    IPW2100_ORD(STAT_RX_REASSN, "Reassociation Rx's"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3664  	    IPW2100_ORD(STAT_RX_REASSN_RESP,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3665  				"Reassociation response Rx's"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3666  	    IPW2100_ORD(STAT_RX_PROBE, "probe Rx's"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3667  	    IPW2100_ORD(STAT_RX_PROBE_RESP, "probe response Rx's"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3668  	    IPW2100_ORD(STAT_RX_BEACON, "Rx beacon"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3669  	    IPW2100_ORD(STAT_RX_ATIM, "Rx ATIM"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3670  	    IPW2100_ORD(STAT_RX_DISASSN, "disassociation Rx"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3671  	    IPW2100_ORD(STAT_RX_AUTH, "authentication Rx"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3672  	    IPW2100_ORD(STAT_RX_DEAUTH, "deauthentication Rx"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3673  	    IPW2100_ORD(STAT_RX_TOTAL_BYTES,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3674  				"Total rx data bytes received"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3675  	    IPW2100_ORD(STAT_RX_ERR_CRC, "packets with Rx CRC error"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3676  	    IPW2100_ORD(STAT_RX_ERR_CRC1, "Rx CRC errors at 1MB"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3677  	    IPW2100_ORD(STAT_RX_ERR_CRC2, "Rx CRC errors at 2MB"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3678  	    IPW2100_ORD(STAT_RX_ERR_CRC5_5, "Rx CRC errors at 5.5MB"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3679  	    IPW2100_ORD(STAT_RX_ERR_CRC11, "Rx CRC errors at 11MB"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3680  	    IPW2100_ORD(STAT_RX_DUPLICATE1,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3681  				"duplicate rx packets at 1MB"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3682  	    IPW2100_ORD(STAT_RX_DUPLICATE2,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3683  				"duplicate rx packets at 2MB"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3684  	    IPW2100_ORD(STAT_RX_DUPLICATE5_5,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3685  				"duplicate rx packets at 5.5MB"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3686  	    IPW2100_ORD(STAT_RX_DUPLICATE11,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3687  				"duplicate rx packets at 11MB"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3688  	    IPW2100_ORD(STAT_RX_DUPLICATE, "duplicate rx packets"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3689  	    IPW2100_ORD(PERS_DB_LOCK, "locking fw permanent  db"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3690  	    IPW2100_ORD(PERS_DB_SIZE, "size of fw permanent  db"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3691  	    IPW2100_ORD(PERS_DB_ADDR, "address of fw permanent  db"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3692  	    IPW2100_ORD(STAT_RX_INVALID_PROTOCOL,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3693  				"rx frames with invalid protocol"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3694  	    IPW2100_ORD(SYS_BOOT_TIME, "Boot time"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3695  	    IPW2100_ORD(STAT_RX_NO_BUFFER,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3696  				"rx frames rejected due to no buffer"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3697  	    IPW2100_ORD(STAT_RX_MISSING_FRAG,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3698  				"rx frames dropped due to missing fragment"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3699  	    IPW2100_ORD(STAT_RX_ORPHAN_FRAG,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3700  				"rx frames dropped due to non-sequential fragment"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3701  	    IPW2100_ORD(STAT_RX_ORPHAN_FRAME,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3702  				"rx frames dropped due to unmatched 1st frame"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3703  	    IPW2100_ORD(STAT_RX_FRAG_AGEOUT,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3704  				"rx frames dropped due to uncompleted frame"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3705  	    IPW2100_ORD(STAT_RX_ICV_ERRORS,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3706  				"ICV errors during decryption"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3707  	    IPW2100_ORD(STAT_PSP_SUSPENSION, "times adapter suspended"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3708  	    IPW2100_ORD(STAT_PSP_BCN_TIMEOUT, "beacon timeout"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3709  	    IPW2100_ORD(STAT_PSP_POLL_TIMEOUT,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3710  				"poll response timeouts"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3711  	    IPW2100_ORD(STAT_PSP_NONDIR_TIMEOUT,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3712  				"timeouts waiting for last {broad,multi}cast pkt"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3713  	    IPW2100_ORD(STAT_PSP_RX_DTIMS, "PSP DTIMs received"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3714  	    IPW2100_ORD(STAT_PSP_RX_TIMS, "PSP TIMs received"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3715  	    IPW2100_ORD(STAT_PSP_STATION_ID, "PSP Station ID"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3716  	    IPW2100_ORD(LAST_ASSN_TIME, "RTC time of last association"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3717  	    IPW2100_ORD(STAT_PERCENT_MISSED_BCNS,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3718  				"current calculation of % missed beacons"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3719  	    IPW2100_ORD(STAT_PERCENT_RETRIES,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3720  				"current calculation of % missed tx retries"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3721  	    IPW2100_ORD(ASSOCIATED_AP_PTR,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3722  				"0 if not associated, else pointer to AP table entry"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3723  	    IPW2100_ORD(AVAILABLE_AP_CNT,
3ea0a58cf9cf66e drivers/net/wireless/intel/ipw2x00/ipw2100.c Colin Ian King   2018-04-28  3724  				"AP's described in the AP table"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3725  	    IPW2100_ORD(AP_LIST_PTR, "Ptr to list of available APs"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3726  	    IPW2100_ORD(STAT_AP_ASSNS, "associations"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3727  	    IPW2100_ORD(STAT_ASSN_FAIL, "association failures"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3728  	    IPW2100_ORD(STAT_ASSN_RESP_FAIL,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3729  				"failures due to response fail"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3730  	    IPW2100_ORD(STAT_FULL_SCANS, "full scans"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3731  	    IPW2100_ORD(CARD_DISABLED, "Card Disabled"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3732  	    IPW2100_ORD(STAT_ROAM_INHIBIT,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3733  				"times roaming was inhibited due to activity"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3734  	    IPW2100_ORD(RSSI_AT_ASSN,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3735  				"RSSI of associated AP at time of association"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3736  	    IPW2100_ORD(STAT_ASSN_CAUSE1,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3737  				"reassociation: no probe response or TX on hop"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3738  	    IPW2100_ORD(STAT_ASSN_CAUSE2,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3739  				"reassociation: poor tx/rx quality"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3740  	    IPW2100_ORD(STAT_ASSN_CAUSE3,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3741  				"reassociation: tx/rx quality (excessive AP load"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3742  	    IPW2100_ORD(STAT_ASSN_CAUSE4,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3743  				"reassociation: AP RSSI level"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3744  	    IPW2100_ORD(STAT_ASSN_CAUSE5,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3745  				"reassociations due to load leveling"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3746  	    IPW2100_ORD(STAT_AUTH_FAIL, "times authentication failed"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3747  	    IPW2100_ORD(STAT_AUTH_RESP_FAIL,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3748  				"times authentication response failed"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3749  	    IPW2100_ORD(STATION_TABLE_CNT,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3750  				"entries in association table"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3751  	    IPW2100_ORD(RSSI_AVG_CURR, "Current avg RSSI"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3752  	    IPW2100_ORD(POWER_MGMT_MODE, "Power mode - 0=CAM, 1=PSP"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3753  	    IPW2100_ORD(COUNTRY_CODE,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3754  				"IEEE country code as recv'd from beacon"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3755  	    IPW2100_ORD(COUNTRY_CHANNELS,
fd9071ec61db420 drivers/net/wireless/ipw2x00/ipw2100.c       Masanari Iida    2012-04-13  3756  				"channels supported by country"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3757  	    IPW2100_ORD(RESET_CNT, "adapter resets (warm)"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3758  	    IPW2100_ORD(BEACON_INTERVAL, "Beacon interval"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3759  	    IPW2100_ORD(ANTENNA_DIVERSITY,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3760  				"TRUE if antenna diversity is disabled"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3761  	    IPW2100_ORD(DTIM_PERIOD, "beacon intervals between DTIMs"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3762  	    IPW2100_ORD(OUR_FREQ,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3763  				"current radio freq lower digits - channel ID"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3764  	    IPW2100_ORD(RTC_TIME, "current RTC time"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3765  	    IPW2100_ORD(PORT_TYPE, "operating mode"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3766  	    IPW2100_ORD(CURRENT_TX_RATE, "current tx rate"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3767  	    IPW2100_ORD(SUPPORTED_RATES, "supported tx rates"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3768  	    IPW2100_ORD(ATIM_WINDOW, "current ATIM Window"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3769  	    IPW2100_ORD(BASIC_RATES, "basic tx rates"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3770  	    IPW2100_ORD(NIC_HIGHEST_RATE, "NIC highest tx rate"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3771  	    IPW2100_ORD(AP_HIGHEST_RATE, "AP highest tx rate"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3772  	    IPW2100_ORD(CAPABILITIES,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3773  				"Management frame capability field"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3774  	    IPW2100_ORD(AUTH_TYPE, "Type of authentication"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3775  	    IPW2100_ORD(RADIO_TYPE, "Adapter card platform type"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3776  	    IPW2100_ORD(RTS_THRESHOLD,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3777  				"Min packet length for RTS handshaking"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3778  	    IPW2100_ORD(INT_MODE, "International mode"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3779  	    IPW2100_ORD(FRAGMENTATION_THRESHOLD,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3780  				"protocol frag threshold"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3781  	    IPW2100_ORD(EEPROM_SRAM_DB_BLOCK_START_ADDRESS,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3782  				"EEPROM offset in SRAM"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3783  	    IPW2100_ORD(EEPROM_SRAM_DB_BLOCK_SIZE,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3784  				"EEPROM size in SRAM"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3785  	    IPW2100_ORD(EEPROM_SKU_CAPABILITY, "EEPROM SKU Capability"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3786  	    IPW2100_ORD(EEPROM_IBSS_11B_CHANNELS,
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3787  				"EEPROM IBSS 11b channel set"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3788  	    IPW2100_ORD(MAC_VERSION, "MAC Version"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3789  	    IPW2100_ORD(MAC_REVISION, "MAC Revision"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3790  	    IPW2100_ORD(RADIO_VERSION, "Radio Version"),
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3791  	    IPW2100_ORD(NIC_MANF_DATE_TIME, "MANF Date/Time STAMP"),
ee8e365aa6395e7 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-09-14  3792  	    IPW2100_ORD(UCODE_VERSION, "Ucode Version"),};
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3793  
edfc43f2ec542c1 drivers/net/wireless/ipw2100.c               Andrew Morton    2005-06-20 @3794  static ssize_t show_registers(struct device *d, struct device_attribute *attr,
edfc43f2ec542c1 drivers/net/wireless/ipw2100.c               Andrew Morton    2005-06-20  3795  			      char *buf)
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3796  {
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3797  	int i;
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3798  	struct ipw2100_priv *priv = dev_get_drvdata(d);
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3799  	struct net_device *dev = priv->net_dev;
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3800  	char *out = buf;
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3801  	u32 val = 0;
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3802  
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3803  	out += sprintf(out, "%30s [Address ] : Hex\n", "Register");
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3804  
22d574324939d62 drivers/net/wireless/ipw2100.c               Ahmed S. Darwish 2007-02-05  3805  	for (i = 0; i < ARRAY_SIZE(hw_data); i++) {
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3806  		read_register(dev, hw_data[i].addr, &val);
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3807  		out += sprintf(out, "%30s [%08X] : %08X\n",
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3808  			       hw_data[i].name, hw_data[i].addr, val);
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3809  	}
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3810  
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3811  	return out - buf;
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3812  }
2c86c275015c880 drivers/net/wireless/ipw2100.c               James Ketrenos   2005-03-23  3813  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
