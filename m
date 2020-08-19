Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2607524A767
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 19 Aug 2020 22:02:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k8UIJ-0001B0-TI
	for lists+kgdb-bugreport@lfdr.de; Wed, 19 Aug 2020 20:02:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <davem@davemloft.net>) id 1k8UII-0001At-Fk
 for kgdb-bugreport@lists.sourceforge.net; Wed, 19 Aug 2020 20:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7d2ZnGAIbd2KkJgir+QTMbyw97UIlQ/0iFkILhnRkAg=; b=b5eG0y7JPihYtb+ZZNZSLW1xLK
 iZYqbSMXZrQCVhxW1RGiACmqEeua413ohvtH+rHvD2WXXpUVg3D5PKcMKaLLvlfIxNn0jz3cWcRSN
 Suklrlck0DLLw2/2rLzuCDwFtukvzyPJ19I8jrpmnkWWvCfN6pb8QGdiUpZ1AVtpimPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7d2ZnGAIbd2KkJgir+QTMbyw97UIlQ/0iFkILhnRkAg=; b=Fb0tcIyt6YoB4uEf+GmaqkdTRT
 HXl6sr8cnS4QqYofVanrDk1IxKcMLu3DOn/oJPqwW8F6v6cO82ZoYvW7n0e7sLp8kMd7SB+Zg1522
 MZsw/XRdVUQuTCC0IW9DCb2pVmuE0tGvFR5nMPCLjKibej2MEqlNrr1Wj77KXM3Uczfo=;
Received: from shards.monkeyblade.net ([23.128.96.9])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k8UIF-00GOrE-B2
 for kgdb-bugreport@lists.sourceforge.net; Wed, 19 Aug 2020 20:02:46 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 32B9F11E45763;
 Wed, 19 Aug 2020 12:45:37 -0700 (PDT)
Date: Wed, 19 Aug 2020 13:02:22 -0700 (PDT)
Message-Id: <20200819.130222.1915954815957844234.davem@davemloft.net>
To: christian.brauner@ubuntu.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200819104655.436656-7-christian.brauner@ubuntu.com>
References: <20200819104655.436656-1-christian.brauner@ubuntu.com>
 <20200819104655.436656-7-christian.brauner@ubuntu.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 19 Aug 2020 12:45:38 -0700 (PDT)
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: ubuntu.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k8UIF-00GOrE-B2
Subject: Re: [Kgdb-bugreport] [PATCH v2 06/11] sparc: switch to
 kernel_clone()
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
Cc: alexandre.chartre@oracle.com, linux-doc@vger.kernel.org,
 peterz@infradead.org, kgdb-bugreport@lists.sourceforge.net,
 jongk@linux-m68k.org, willy@infradead.org, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-ia64@vger.kernel.org, shorne@gmail.com,
 linux-arch@vger.kernel.org, zanussi@kernel.org, ysato@users.sourceforge.jp,
 corbet@lwn.net, mchehab+huawei@kernel.org, x86@kernel.org,
 ley.foon.tan@intel.com, hch@infradead.org, mingo@redhat.com,
 geert@linux-m68k.org, mhiramat@kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, fenghua.yu@intel.com,
 keescook@chromium.org, arnd@arndb.de, rostedt@goodmis.org,
 linux-m68k@lists.linux-m68k.org, bp@alien8.de, green.hu@gmail.com,
 tglx@linutronix.de, yangx.jy@cn.fujitsu.com, tony.luck@intel.com,
 linux-kernel@vger.kernel.org, ebiederm@xmission.com,
 torvalds@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Christian Brauner <christian.brauner@ubuntu.com>
Date: Wed, 19 Aug 2020 12:46:50 +0200

> The old _do_fork() helper is removed in favor of the new kernel_clone() helper.
> The latter adheres to naming conventions for kernel internal syscall helpers.
> 
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: sparclinux@vger.kernel.org
> Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>

Acked-by: David S. Miller <davem@davemloft.net>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
