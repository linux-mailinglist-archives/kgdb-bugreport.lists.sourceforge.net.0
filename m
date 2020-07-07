Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DFF2175D2
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  7 Jul 2020 20:05:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jsrxl-0000jO-MX
	for lists+kgdb-bugreport@lfdr.de; Tue, 07 Jul 2020 18:05:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rdunlap@infradead.org>) id 1jsrxk-0000j9-0y
 for kgdb-bugreport@lists.sourceforge.net; Tue, 07 Jul 2020 18:05:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ljom0Anfyg1biDMYz87so/NXDLxx9+qjBdkF8XNueFk=; b=E5Ss++5B1RjbsR654naamD97dr
 /4OdDRdZSayMW643s6h1ta57gwnTxOVXcjyzfHRiac3CLGQ/mqy2I6Iz+z7aincUm39A2zqYRDaCl
 dBK71wSxALP43bW13VCxtx6xIUffdUjONqb9HJGU1tc9PGWr1i8OTmJQttgfWEGBZPCA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ljom0Anfyg1biDMYz87so/NXDLxx9+qjBdkF8XNueFk=; b=E
 QuxrT/5Vva468qTKkItKg7PTpCpeSPEm3mdw8Lf7Tz/eyNyRfh5AQKLUiU8vsioxPggwxwN9jYZF0
 YPWPxMPDrvPbsr5Xdr8JT/EhiTEXdI3/1/BdKCpJdQhCl6Pe64SvdiQpKioXSM7Y5V6P0V+S4Sorg
 EBDSIGJmI2dfV/Jg=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jsrxg-00GRDI-MD
 for kgdb-bugreport@lists.sourceforge.net; Tue, 07 Jul 2020 18:04:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=ljom0Anfyg1biDMYz87so/NXDLxx9+qjBdkF8XNueFk=; b=XPmbzEYSKiY23UCv9H7rAcJy2R
 M7f7R8q2JHTzLF3fw5HDgcGaxp50+pOpgQn9qzOfGc74gtagEHV6Q7icIU0zjblMzjT37udLesnhL
 t6zRDl4JbRnBH5eM4X4N08FrnDesy4TICQvkIVYNQ8qvb6PGJ54hisXDryvCJ2pZ7yLDPk64h4NLJ
 DKL+uTadTIlOv1Xkb55ANjt9sGtxhzSXyjNGbdgi4aMS6aiS0LxO0yhgK/hKDfFkwdaZv9KA85XN0
 CQPh5QhdrPKTQrQWVmG8u7dBe25NlxmYEqNYA8r1RB15O4/YZf2A/GsS1D5msHGoGj7fh08TONrvJ
 T0Hln73w==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsrxD-0004JY-KG; Tue, 07 Jul 2020 18:04:28 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Tue,  7 Jul 2020 11:03:54 -0700
Message-Id: <20200707180414.10467-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jsrxg-00GRDI-MD
Subject: [Kgdb-bugreport] [PATCH 00/20] Documentation: eliminate duplicated
 words
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
 keyrings@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
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

Drop doubled words in various parts of Documentation/.


Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: linux-mm@vger.kernel.org
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org
Cc: Jason Wessel <jason.wessel@windriver.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: kgdb-bugreport@lists.sourceforge.net
Cc: Wu Hao <hao.wu@intel.com>
Cc: linux-fpga@vger.kernel.org
Cc: James (Qian) Wang <james.qian.wang@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Mihail Atanassov <mihail.atanassov@arm.com>
Cc: Mali DP Maintainers <malidp@foss.arm.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: linux-input@vger.kernel.org
Cc: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: linux-leds@vger.kernel.org
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: Derek Kiernan <derek.kiernan@xilinx.com>
Cc: Dragan Cvetic <dragan.cvetic@xilinx.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Tony Krowiak <akrowiak@linux.ibm.com>
Cc: Pierre Morel <pmorel@linux.ibm.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: linux-s390@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Hannes Reinecke <hare@suse.com>
Cc: linux-scsi@vger.kernel.org
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: James Bottomley <jejb@linux.ibm.com>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Mimi Zohar <zohar@linux.ibm.com>
Cc: linux-integrity@vger.kernel.org
Cc: keyrings@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>


 Documentation/admin-guide/mm/numaperf.rst             |    2 +-
 Documentation/block/pr.rst                            |    2 +-
 Documentation/core-api/printk-basics.rst              |    2 +-
 Documentation/dev-tools/kgdb.rst                      |    2 +-
 Documentation/fpga/dfl.rst                            |    2 +-
 Documentation/gpu/drm-uapi.rst                        |    2 +-
 Documentation/gpu/komeda-kms.rst                      |    2 +-
 Documentation/hid/intel-ish-hid.rst                   |    2 +-
 Documentation/i2c/upgrading-clients.rst               |    2 +-
 Documentation/kbuild/kconfig-language.rst             |    2 +-
 Documentation/leds/ledtrig-transient.rst              |    2 +-
 Documentation/maintainer/maintainer-entry-profile.rst |    2 +-
 Documentation/mips/ingenic-tcu.rst                    |    2 +-
 Documentation/misc-devices/xilinx_sdfec.rst           |    2 +-
 Documentation/powerpc/vas-api.rst                     |    2 +-
 Documentation/s390/vfio-ap.rst                        |    2 +-
 Documentation/scsi/advansys.rst                       |    2 +-
 Documentation/security/keys/trusted-encrypted.rst     |    2 +-
 Documentation/virt/kvm/api.rst                        |    2 +-
 Documentation/vm/memory-model.rst                     |    2 +-
 20 files changed, 20 insertions(+), 20 deletions(-)


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
