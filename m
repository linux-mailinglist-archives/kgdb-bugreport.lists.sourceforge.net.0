Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4746F21EB7B
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 14 Jul 2020 10:34:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jvGOV-0002qS-2Q
	for lists+kgdb-bugreport@lfdr.de; Tue, 14 Jul 2020 08:34:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <corbet@lwn.net>) id 1jv0eN-00037a-5u
 for kgdb-bugreport@lists.sourceforge.net; Mon, 13 Jul 2020 15:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xt3FQQdkkxbR2FgNRJ5+aj0O4jl97Pcoze/+Fx9Q2h8=; b=nKcRBeEl7/2FYIUMoXgeFJvq/M
 FacGQqjYcaE2JSHKfTYu7nvisRzBW84ttQQTWcmVfQiXOHbzRBPLWSMP4zI3lp4KcEVRvWAhDoB9H
 BQ3c1nF/GhwhSaXd82p8AtT/o0n22QDCKi9IhcQnzG0jhQ7eqxfEzWJJD0QkcAJMiyps=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xt3FQQdkkxbR2FgNRJ5+aj0O4jl97Pcoze/+Fx9Q2h8=; b=eaq4bgNphpYjMXDSrOs2r2Zz9t
 /6vlXJW8dW+6xVugE5ff2Zr2Dlc4AlE+ccG+iMNkcmuu8pKX4pJdSsDLndsRlRAsZWc93kZi0wBnV
 ef8Uhll3bjQtFSug+jd1ejcjKb8qk3LBSvgPC6fdS8Chr5azSv3CiB4Uqoy3peWAGFEA=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jv0eL-005axL-LF
 for kgdb-bugreport@lists.sourceforge.net; Mon, 13 Jul 2020 15:45:51 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id C5A1F823;
 Mon, 13 Jul 2020 15:45:39 +0000 (UTC)
Date: Mon, 13 Jul 2020 09:45:38 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20200713094538.68e0c810@lwn.net>
In-Reply-To: <20200707180414.10467-1-rdunlap@infradead.org>
References: <20200707180414.10467-1-rdunlap@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [45.79.88.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jv0eL-005axL-LF
X-Mailman-Approved-At: Tue, 14 Jul 2020 08:34:30 +0000
Subject: Re: [Kgdb-bugreport] [PATCH 00/20] Documentation: eliminate
 duplicated words
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
 Paul Cercueil <paul@crapouillou.net>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-scsi@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Masahiro Yamada <masahiroy@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Wang <james.qian.wang@arm.com>, linux-input@vger.kernel.org,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>, linux-mips@vger.kernel.org,
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
 Pierre Morel <pmorel@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jason Wessel <jason.wessel@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue,  7 Jul 2020 11:03:54 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

>  Documentation/admin-guide/mm/numaperf.rst             |    2 +-
>  Documentation/block/pr.rst                            |    2 +-
>  Documentation/core-api/printk-basics.rst              |    2 +-
>  Documentation/dev-tools/kgdb.rst                      |    2 +-
>  Documentation/fpga/dfl.rst                            |    2 +-
>  Documentation/gpu/drm-uapi.rst                        |    2 +-
>  Documentation/gpu/komeda-kms.rst                      |    2 +-
>  Documentation/hid/intel-ish-hid.rst                   |    2 +-
>  Documentation/i2c/upgrading-clients.rst               |    2 +-
>  Documentation/kbuild/kconfig-language.rst             |    2 +-
>  Documentation/leds/ledtrig-transient.rst              |    2 +-
>  Documentation/maintainer/maintainer-entry-profile.rst |    2 +-
>  Documentation/mips/ingenic-tcu.rst                    |    2 +-
>  Documentation/misc-devices/xilinx_sdfec.rst           |    2 +-
>  Documentation/powerpc/vas-api.rst                     |    2 +-
>  Documentation/s390/vfio-ap.rst                        |    2 +-
>  Documentation/scsi/advansys.rst                       |    2 +-
>  Documentation/security/keys/trusted-encrypted.rst     |    2 +-
>  Documentation/virt/kvm/api.rst                        |    2 +-
>  Documentation/vm/memory-model.rst                     |    2 +-
>  20 files changed, 20 insertions(+), 20 deletions(-)

I've applied this set, minus #17 that was already picked up by Martin.

Thanks,

jon


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
