Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD5C815DA5
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 17 Dec 2023 06:18:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rEjXx-0004FJ-JE
	for lists+kgdb-bugreport@lfdr.de;
	Sun, 17 Dec 2023 05:18:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1rEjXv-0004FD-7F
 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 17 Dec 2023 05:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UtUaX9Zix7uWSXkEtRBJTzeN05dCme6W+kBPovQngKI=; b=UdColmnAG2AI+ccCVMBkbTatwV
 FwLqndCE/hlaN0OV96oxxhs1y8iCntaygh1Xh0XNJrkm8MR8wF6k8luAg97n+YernjUXVcJgKEj91
 FNvHL1uKS9oJiA7rv1cQsVV93XbtvhJGivtqAHSVOFDZA3senh2kr/bCo9rvJktL7Iww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UtUaX9Zix7uWSXkEtRBJTzeN05dCme6W+kBPovQngKI=; b=Bnc86TNEtu6ROftkEynPJ/xdph
 Ap+WctsBq4ZHyiS2aDWXJ5GLLwnbkSdXVF27Vb/IecaSet9g9I16KcpLOEVNd7Ac0XYq+7QKcZlob
 JOBfw+yIZ1/z9+o1tMfeM8uuSti9qbtPTMMHcqUskYu3YRcKCyeI725r04bw04wU8qrk=;
Received: from mgamail.intel.com ([198.175.65.11])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rEjXq-0000fa-RK for kgdb-bugreport@lists.sourceforge.net;
 Sun, 17 Dec 2023 05:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702790311; x=1734326311;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PPSkO0bQFhCKhK6lVott3/8pp9aqVOo3T+bZ0TjgAp4=;
 b=DodUQW0V3KFKrq/bK1NJkOevtgbPjbx/AAetYc6ZFDFFJRVzp9hj7qKZ
 Ix+Cy6hCB3FpGNu4C9CkRfUkbQg/fvFmb6UPwuopNvZvTy3CuF+/rriRw
 sOmtMbnkFLkNyi7IiAnB8YEmEmkvBUgYRRXwuJUaIzObhEfqEVlG3dnmW
 5g3uTTTXpO7NQyEAsfkHW7MlB1IFf+nUT8s6Zak3eTwOAoQ2GTDnbvSVV
 4wGTP8DMVTH1wcPOlUCQu1e9JvcPWQK8nOtsEEymQIapip7fp3wbWo2Ui
 uffLZdfu1JcJBzaDRF+JYBJ9u44HVwrdiH771RIsrpnMSbnFgfNzfcITD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="2240108"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="2240108"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2023 21:18:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="804157025"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; d="scan'208";a="804157025"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 16 Dec 2023 21:18:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rEjXe-0002gc-2Q;
 Sun, 17 Dec 2023 05:18:18 +0000
Date: Sun, 17 Dec 2023 13:17:50 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Trimarchi <michael@amarulasolutions.com>
Message-ID: <202312171302.vjOAqLOI-lkp@intel.com>
References: <20231216173409.1264655-1-michael@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231216173409.1264655-1-michael@amarulasolutions.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Michael, kernel test robot noticed the following build
 errors: [auto build test ERROR on tty/tty-testing] [also build test ERROR
 on tty/tty-next tty/tty-linus linus/master v6.7-rc5 next-20231215] [If your
 patch is applied to the wrong git tree, kindly drop us a n [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rEjXq-0000fa-RK
Subject: Re: [Kgdb-bugreport] [PATCH] tty: serial: kgdboc: Fix 8250_* kgd
 over serial
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
Cc: daniel.thompson@linaro.org, gregkh@linuxfoundation.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-serial@vger.kernel.org,
 jason.wessel@windriver.com, kgdb-bugreport@lists.sourceforge.net,
 jirislaby@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Michael,

kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next tty/tty-linus linus/master v6.7-rc5 next-20231215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Trimarchi/tty-serial-kgdboc-Fix-8250_-kgd-over-serial/20231217-013726
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20231216173409.1264655-1-michael%40amarulasolutions.com
patch subject: [PATCH] tty: serial: kgdboc: Fix 8250_* kgd over serial
config: i386-buildonly-randconfig-003-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171302.vjOAqLOI-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171302.vjOAqLOI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171302.vjOAqLOI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/serial_core.c:2636:26: error: expression is not assignable
           if (!port || port->type = PORT_UNKNOWN || !(port->ops->poll_get_char && port->ops->poll_put_char)) {
               ~~~~~~~~~~~~~~~~~~~ ^
   1 error generated.


vim +2636 drivers/tty/serial/serial_core.c

  2618	
  2619	static int uart_poll_init(struct tty_driver *driver, int line, char *options)
  2620	{
  2621		struct uart_driver *drv = driver->driver_state;
  2622		struct uart_state *state = drv->state + line;
  2623		enum uart_pm_state pm_state;
  2624		struct tty_port *tport;
  2625		struct uart_port *port;
  2626		int baud = 9600;
  2627		int bits = 8;
  2628		int parity = 'n';
  2629		int flow = 'n';
  2630		int ret = 0;
  2631	
  2632		tport = &state->port;
  2633		mutex_lock(&tport->mutex);
  2634	
  2635		port = uart_port_check(state);
> 2636		if (!port || port->type = PORT_UNKNOWN || !(port->ops->poll_get_char && port->ops->poll_put_char)) {
  2637			ret = -1;
  2638			goto out;
  2639		}
  2640	
  2641		pm_state = state->pm_state;
  2642		uart_change_pm(state, UART_PM_STATE_ON);
  2643	
  2644		if (port->ops->poll_init) {
  2645			/*
  2646			 * We don't set initialized as we only initialized the hw,
  2647			 * e.g. state->xmit is still uninitialized.
  2648			 */
  2649			if (!tty_port_initialized(tport))
  2650				ret = port->ops->poll_init(port);
  2651		}
  2652	
  2653		if (!ret && options) {
  2654			uart_parse_options(options, &baud, &parity, &bits, &flow);
  2655			console_list_lock();
  2656			ret = uart_set_options(port, NULL, baud, parity, bits, flow);
  2657			console_list_unlock();
  2658		}
  2659	out:
  2660		if (ret)
  2661			uart_change_pm(state, pm_state);
  2662		mutex_unlock(&tport->mutex);
  2663		return ret;
  2664	}
  2665	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
