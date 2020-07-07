Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F8F2175ED
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  7 Jul 2020 20:08:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jss0m-0000tL-GR
	for lists+kgdb-bugreport@lfdr.de; Tue, 07 Jul 2020 18:08:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rdunlap@infradead.org>) id 1jss0k-0000tD-UC
 for kgdb-bugreport@lists.sourceforge.net; Tue, 07 Jul 2020 18:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K5P4I52OmjG0Sl6pNIztAMb1sxWsy+0tk7m8cTC1PU4=; b=a4B1fLYS/n32XdGuZkG+2Iwr5b
 AjsQu2YtYk/VZhwIt7/LQNpzyLvk/wd6BbwBWSlq/2DuVYblrsyT7wmQkOf60nBRb/RPLcDu8PxkG
 gmijlBT1OMjIXzPGzzJ8C0ycxv6O6uKSWUbeHiACm5EH3cDOObH4AFmqLRUnXAozRCnI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K5P4I52OmjG0Sl6pNIztAMb1sxWsy+0tk7m8cTC1PU4=; b=hd8qJ9Gbrm5ZRv/Em0u4kKhNkx
 xqFlj/zQnsSAIToQTXn5svLTWjijUHHejdhlogoRoIvv9OnHzlisMu503ePH6vAGN95PYBxeRejqK
 Q9MrRaraCHLQQXfZaD0/6KGm+5jZWx8BI3MT6xryH+0t1pDmpUdbuV+j25kY4ii7cFlc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jss0j-00DRdb-KK
 for kgdb-bugreport@lists.sourceforge.net; Tue, 07 Jul 2020 18:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=K5P4I52OmjG0Sl6pNIztAMb1sxWsy+0tk7m8cTC1PU4=; b=Z1WekKlxFVdnZGsAJR+/c8fv4z
 pLlP0fDHe0D0I1Ads9xVF93NZUe8X9+r51YmEyXSXlQTBQpi+BrzZLChovSUm2rAPdYwrJ1FeRkOw
 LLi1R2rRN0Z5hHRMsXYTxwfXkWgDStvhzhV2bspd6ddrZTpmxMJdxXcIcS42+C4oCFtPtpxG+aSNw
 TtEKBsokrzD2hCL/WeMkHvPMGuFDQepau4i4BxI51wHJWRJO/nUTNHz/uACsBU3NSbRzYL0r/dq7i
 WYDSvoKho26VE+A7oLydro/T/5L7+x8roGd0fb3QDX9bHa0jJWG0osdPFyECP7OxtqjMxL0Y36h1s
 qQow6Ksg==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jss0X-0004JY-Up; Tue, 07 Jul 2020 18:07:54 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Tue,  7 Jul 2020 11:04:13 -0700
Message-Id: <20200707180414.10467-20-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200707180414.10467-1-rdunlap@infradead.org>
References: <20200707180414.10467-1-rdunlap@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jss0j-00DRdb-KK
Subject: [Kgdb-bugreport] [PATCH 20/20] Documentation: vm/memory-model:
 eliminate duplicated word
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 kgdb-bugreport@lists.sourceforge.net, linux-fpga@vger.kernel.org,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-mm@kvack.org, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-scsi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Halil Pasic <pasic@linux.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Wang <james.qian.wang@arm.com>, linux-input@vger.kernel.org,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Wu Hao <hao.wu@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Hannes Reinecke <hare@suse.com>, linux-block@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-mm@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Jens Axboe <axboe@kernel.dk>, Michal Marek <michal.lkml@markovi.net>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Wolfram Sang <wsa@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Jason Wessel <jason.wessel@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Drop the doubled word "the".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
---
 Documentation/vm/memory-model.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200701.orig/Documentation/vm/memory-model.rst
+++ linux-next-20200701/Documentation/vm/memory-model.rst
@@ -159,7 +159,7 @@ frame. Inside a section, the PFN is the
 The sparse vmemmap uses a virtually mapped memory map to optimize
 pfn_to_page and page_to_pfn operations. There is a global `struct
 page *vmemmap` pointer that points to a virtually contiguous array of
-`struct page` objects. A PFN is an index to that array and the the
+`struct page` objects. A PFN is an index to that array and the
 offset of the `struct page` from `vmemmap` is the PFN of that
 page.
 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
