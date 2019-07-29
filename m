Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 906CE7A56C
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 30 Jul 2019 12:04:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hsOzB-0000IK-Ad
	for lists+kgdb-bugreport@lfdr.de; Tue, 30 Jul 2019 10:04:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hslester96@gmail.com>) id 1hs7LW-0007Xv-6K
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jul 2019 15:13:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CReZX3ZIW9UVm3F381oja+qdURlLghUskZk6mGhexL4=; b=cRKVk8dOMOc+/m62yMKjDlGOLB
 CcXgV1uWtJdAMG+W7Q3kI5SOBFXCSNNBCBchm/Ahd6aybHlnnS/xcr9akRcs5jfTOADRqW29XWh2I
 oOENmn38bH9lAGbqipyc4oag8e00yyF88nXZBKFosi0XwW71rCvhJqT1VK7WP8CWGnzA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CReZX3ZIW9UVm3F381oja+qdURlLghUskZk6mGhexL4=; b=Y
 O2/wntV4dOhm2NEMD0n2wI2fI6Wvuj7+bolncoKJ7boodDuiIKjPgt62mjWMt18qO4SrHspDeLQU2
 7+BHLqVnM0HkpdHwnchhcF7PbmoHY/BlYBu0V3xpAys/A98Gqtfaq3To9HEheVrbUvYT/luFraE9j
 zX/CflouVZsR2kbU=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hs7LR-00EhTh-O8
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jul 2019 15:13:53 +0000
Received: by mail-pf1-f196.google.com with SMTP id 19so28191505pfa.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 29 Jul 2019 08:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CReZX3ZIW9UVm3F381oja+qdURlLghUskZk6mGhexL4=;
 b=DF5eQiR/9iQxp/I05TpQxh96+yZz7SV9RG6uhl8zm5tQDkywRpo7tBrHo6+JYi9DMP
 aIHtjuXNygQy++dokdfX3GdSr9dlSz9bgGKf6DU4b9xcRtUDPafirv5OFFt7xntBUlZn
 j9XvmuoU2MOmMqnoKS+Lf5IRijAZXLO3YL5YivUqg9npFcmjI7ffrnyM4bxclXLs+p3V
 89IiySx2lv/p3CIxLGE/Lan/Kj6cJbPLYkh7Npa85VJ89wVuDve2mibdyFGFJyGUsvSq
 UdQYN969Ua7dgZYoTV74bAdwxPJ56h4tOpoaX8SKamq34W+W1tIrFUBiMsFps7A/3pBX
 3Y5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CReZX3ZIW9UVm3F381oja+qdURlLghUskZk6mGhexL4=;
 b=b0kFXjJPVvSuGkfyUJGPNWaUqHE51/VI0NQN6pXhQSrV5zVrGSvpv9xBy5Zh+yQ1QR
 6aE77XgELY+4KmsAxcAVDs3AWZfsRq8ybsH/gzngPoW4LsX7BsGbqs7gFzQH9qe9Ikuy
 zpT0Ir3TmnG6qJzrWPwAKFiXWiKuEVkgtSKuX7+nL5Qp6UPYymngZLMRQ6B1R8SDZPlx
 6TMTBnxB2AaxVNdOsBCLl5uc5wme9ZiUfmQXh9FOj/6CAQGp8pxo29iprCZqchKUi8i8
 C2mbd8ZeFUfMXsyi/LJiT0bg2Wcid/OAX+aL1PSVvOQnJFNzisDKW6QwXk4hzLNV2a9M
 vKLA==
X-Gm-Message-State: APjAAAWzC5v87d21jFpOt+HreHD05NLIdrhtWoAQ8igl8J40TaQoIJzc
 +g6uqdKOA1OsCpV/Jz/xeck=
X-Google-Smtp-Source: APXvYqxycRdMpLgXrpeUG1h0C8XXmc1sTfWKOqLpMdVBbrO+ryHMITBy2w3gpaZ3FHBwmuORXJgyLw==
X-Received: by 2002:a63:6056:: with SMTP id
 u83mr100397059pgb.181.1564413223953; 
 Mon, 29 Jul 2019 08:13:43 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id v184sm57845951pgd.34.2019.07.29.08.13.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 08:13:43 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Date: Mon, 29 Jul 2019 23:13:23 +0800
Message-Id: <20190729151323.9226-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.196 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hslester96[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (hslester96[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hs7LR-00EhTh-O8
X-Mailman-Approved-At: Tue, 30 Jul 2019 10:03:59 +0000
Subject: [Kgdb-bugreport] [PATCH 00/12] Replace strncmp with str_has_prefix
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
Cc: Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, Pavel Machek <pavel@ucw.cz>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Ingo Molnar <mingo@redhat.com>,
 Jason Wessel <jason.wessel@windriver.com>, Len Brown <len.brown@intel.com>,
 linux-pm@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Chuhong Yuan <hslester96@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 cgroups@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 iommu@lists.linux-foundation.org, Li Zefan <lizefan@huawei.com>,
 Jessica Yu <jeyu@kernel.org>, Tejun Heo <tj@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The commit 72921427d46b
("string.h: Add str_has_prefix() helper function")
introduced str_has_prefix() to substitute error-prone
strncmp(str, const, len).

The commit b6b2735514bc
("tracing: Use str_has_prefix() instead of using fixed sizes")
has fixed some codes.

These patches use str_has_prefix to replace
such pattern of strncmp usages.

Chuhong Yuan (12):
  rdmacg: Replace strncmp with str_has_prefix
  kdb: Replace strncmp with str_has_prefix
  dma-debug: Replace strncmp with str_has_prefix
  gcov: Replace strncmp with str_has_prefix
  genirq/debugfs: Replace strncmp with str_has_prefix
  module: Replace strncmp with str_has_prefix
  power: Replace strncmp with str_has_prefix
  printk: Replace strncmp with str_has_prefix
  reboot: Replace strncmp with str_has_prefix
  sched: Replace strncmp with str_has_prefix
  userns: Replace strncmp with str_has_prefix
  watchdog: Replace strncmp with str_has_prefix

 kernel/cgroup/rdma.c        | 2 +-
 kernel/debug/kdb/kdb_main.c | 2 +-
 kernel/dma/debug.c          | 2 +-
 kernel/gcov/fs.c            | 2 +-
 kernel/irq/debugfs.c        | 2 +-
 kernel/module.c             | 2 +-
 kernel/power/hibernate.c    | 8 ++++----
 kernel/power/main.c         | 2 +-
 kernel/printk/braille.c     | 4 ++--
 kernel/printk/printk.c      | 6 +++---
 kernel/reboot.c             | 2 +-
 kernel/sched/debug.c        | 2 +-
 kernel/sched/isolation.c    | 4 ++--
 kernel/user_namespace.c     | 4 ++--
 kernel/watchdog.c           | 8 ++++----
 15 files changed, 26 insertions(+), 26 deletions(-)

-- 
2.20.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
