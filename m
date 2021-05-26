Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3DF396EA5
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  1 Jun 2021 10:17:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lnzaP-0003wj-1T
	for lists+kgdb-bugreport@lfdr.de; Tue, 01 Jun 2021 08:17:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <thunder.leizhen@huawei.com>) id 1llkcS-0003Ll-MP
 for kgdb-bugreport@lists.sourceforge.net; Wed, 26 May 2021 03:54:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P+gSuTaBpAF0+2pNZlhS/0C92mqsexPvGjxoALTu4wc=; b=MaDtyp+4K3THPfZ4csIgcoZSGU
 BQCsIBP0GC8JZpAGQgFQZWo8u3woAoVZsJMiw8E/WfoCoREqSM6dhGlsyBb2PPt9g+X0ZllfqBEgm
 JrujX/+K1bwIY00HTfjHLnZExb2EWBzrpUm5Tt5Bgdi3o2Z5lX1gFV+kRlmexDKpc0l4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=P+gSuTaBpAF0+2pNZlhS/0C92mqsexPvGjxoALTu4wc=; b=l
 8rqyeA/3HpqW93nrXu/S2/hMnZz6w8yoTn2tBrj7sd09Z/UhCggh6/NTI3kcuKI7bdbCnZ82VYE5v
 ZvDKRznOmZEKsybFCKhxOLkrlnudRmwhxICcC1tk/t7yBQeOG7PByaXUntD2bXHoaiUYdlsq86Wso
 Si71N3cTOSMb/QS8=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1llkcQ-0065ex-QY
 for kgdb-bugreport@lists.sourceforge.net; Wed, 26 May 2021 03:54:11 +0000
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FqcSB33GVz1BN3t;
 Wed, 26 May 2021 11:51:06 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 26 May 2021 11:53:58 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 26 May 2021 11:53:56 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Jason Wessel <jason.wessel@windriver.com>, Daniel Thompson
 <daniel.thompson@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 Balbir Singh <bsingharora@gmail.com>, Barry Song
 <song.bao.hua@hisilicon.com>, Christoph Hellwig <hch@lst.de>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, Davidlohr Bueso
 <dave@stgolabs.net>, Eric Biederman <ebiederm@xmission.com>, "Naveen N . Rao"
 <naveen.n.rao@linux.ibm.com>, Anil S Keshavamurthy
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jessica Yu <jeyu@kernel.org>,
 "Steffen Klassert" <steffen.klassert@secunet.com>, Daniel Jordan
 <daniel.m.jordan@oracle.com>, Oleg Nesterov <oleg@redhat.com>, John Stultz
 <john.stultz@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, kgdb-bugreport
 <kgdb-bugreport@lists.sourceforge.net>, kexec <kexec@lists.infradead.org>,
 linux-crypto <linux-crypto@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Date: Wed, 26 May 2021 11:53:44 +0800
Message-ID: <20210526035345.9113-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1llkcQ-0065ex-QY
X-Mailman-Approved-At: Tue, 01 Jun 2021 08:17:14 +0000
Subject: [Kgdb-bugreport] [PATCH 0/1] kernel: fix numerous spelling mistakes
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

These files are not organized by module(subdirectory), or even if they can, the
number of spelling mistakes is small and not worth generating a separate patch.

This patch is based on the latest linux-next. But except the modification of
kernel/delayacct.c, the remaining can also be applied on 5.13-rc3.


Zhen Lei (1):
  kernel: fix numerous spelling mistakes

 kernel/acct.c                  | 2 +-
 kernel/context_tracking.c      | 2 +-
 kernel/cpu.c                   | 2 +-
 kernel/debug/debug_core.c      | 2 +-
 kernel/debug/kdb/kdb_main.c    | 8 ++++----
 kernel/debug/kdb/kdb_private.h | 2 +-
 kernel/delayacct.c             | 2 +-
 kernel/dma/map_benchmark.c     | 2 +-
 kernel/dma/swiotlb.c           | 2 +-
 kernel/exit.c                  | 2 +-
 kernel/hung_task.c             | 2 +-
 kernel/kexec_core.c            | 2 +-
 kernel/kprobes.c               | 2 +-
 kernel/latencytop.c            | 2 +-
 kernel/module.c                | 4 ++--
 kernel/notifier.c              | 2 +-
 kernel/padata.c                | 2 +-
 kernel/panic.c                 | 2 +-
 kernel/pid.c                   | 2 +-
 kernel/ptrace.c                | 2 +-
 kernel/relay.c                 | 2 +-
 kernel/signal.c                | 4 ++--
 kernel/smp.c                   | 2 +-
 kernel/taskstats.c             | 2 +-
 kernel/time/alarmtimer.c       | 2 +-
 kernel/time/timer.c            | 4 ++--
 kernel/umh.c                   | 2 +-
 kernel/user_namespace.c        | 2 +-
 kernel/usermode_driver.c       | 2 +-
 kernel/watchdog.c              | 2 +-
 kernel/workqueue.c             | 4 ++--
 31 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.25.1




_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
