Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FD6396EA9
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  1 Jun 2021 10:17:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lnzaP-0003xV-H5
	for lists+kgdb-bugreport@lfdr.de; Tue, 01 Jun 2021 08:17:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <thunder.leizhen@huawei.com>) id 1lmwki-0001rH-Cx
 for kgdb-bugreport@lists.sourceforge.net; Sat, 29 May 2021 11:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QSskxddoMfaGBWRLYpeMLJKuuQcQQ3OO69X+L5Hsjqg=; b=lyPk3tvePGSNOcrz8dsd/tioVT
 DVwKZQu2ISLidTCFWjbSqDAk4hxeNBYUmL1fvg0f9LGeICM0W8YOiY/TtZvicWxhHnZXe1p05vUwY
 YVoejpsMhDKBwwWKomFoBu9h8XYFqhPMDyEjWHdrZs2rSO2rGHnXmk1G6IcX8o3uA6k4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QSskxddoMfaGBWRLYpeMLJKuuQcQQ3OO69X+L5Hsjqg=; b=e
 LBC2v/rZKJdQxnLx1T0QBlrBEEWZwj8ZX8jZSCLvzTsQlLTrSz0aPOoiafVhTYR6K3sUW/17Crnzm
 lZCTs969ufo1/zUmSMU5GiVRcONqtc6pVR6tZlh0yuQND/48LxOvfTjamvftOajH+gzulMd0F9EPz
 qvIlnnYNg0H8YefI=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lmwkf-0008WK-JC
 for kgdb-bugreport@lists.sourceforge.net; Sat, 29 May 2021 11:03:38 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FsdpH58gHzWplV;
 Sat, 29 May 2021 18:58:47 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 29 May 2021 19:03:25 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 29 May 2021 19:03:24 +0800
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
Date: Sat, 29 May 2021 19:03:01 +0800
Message-ID: <20210529110305.9446-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lmwkf-0008WK-JC
X-Mailman-Approved-At: Tue, 01 Jun 2021 08:17:15 +0000
Subject: [Kgdb-bugreport] [PATCH v2 0/4] kernel: fix some spelling mistakes
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

v1 --> v2:
Split into several small patches and add fixes to header files. Since there are
so many patches after the split, only three reviewed modules and one time module
with relatively more changes are retained. The spelling mistakes on the rest of
the modules will be fixed in later versions.

The header file linux/freelist.h is only included by linux/kprobes.h, so grouped
it with kprobes.c

Zhen Lei (4):
  kprobes: Fix spelling mistakes
  kgdb: Fix spelling mistakes
  kexec: fix a spelling mistake in comment
  time: Fix spelling mistakes

 include/linux/freelist.h       | 2 +-
 include/linux/kgdb.h           | 8 ++++----
 include/linux/timekeeping.h    | 2 +-
 include/linux/timer.h          | 2 +-
 kernel/debug/debug_core.c      | 2 +-
 kernel/debug/kdb/kdb_main.c    | 8 ++++----
 kernel/debug/kdb/kdb_private.h | 2 +-
 kernel/kexec_core.c            | 2 +-
 kernel/kprobes.c               | 2 +-
 kernel/time/alarmtimer.c       | 2 +-
 kernel/time/timer.c            | 4 ++--
 11 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.25.1




_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
