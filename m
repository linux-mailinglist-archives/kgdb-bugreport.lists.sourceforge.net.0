Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FEC21887F
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  8 Jul 2020 15:09:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jt9oz-0000cW-Jq
	for lists+kgdb-bugreport@lfdr.de; Wed, 08 Jul 2020 13:09:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <paul@crapouillou.net>) id 1jssZr-0001NW-CW
 for kgdb-bugreport@lists.sourceforge.net; Tue, 07 Jul 2020 18:44:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Cc:To:Subject:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EQRrwbfO2C4Em9LcWxXzackWTr0tQ5tvZFSRH8pCMe0=; b=moxzdWzfBDT8yGKU6XSnPcnQmp
 UwSqBQAD0WwnpXPwf84g6ZIpCR1xhrpyCBl+J1xL5Dms84zyVJiPNTtvCWBHDMU+qlD/yAL2SzLKQ
 B1bBt9SbABHvG7WvUMfFrrhsfTb9beKSrMF+/FGg3kWJ3DtMhLGksfoNxWjfvp376KhE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Cc:To:Subject:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EQRrwbfO2C4Em9LcWxXzackWTr0tQ5tvZFSRH8pCMe0=; b=T6BpnrMEPohxcoR/G3AKDeF25N
 mTuUU6e8jDBEi907ekTQRp2V6Vu/MtrPae/aaXL4C29Pp63Cfrrfzj8KAzp1pxMZHqdMYCt4v3Grb
 Hm3NoMTuZhUQ0KnVd67LZhXj7HmkGAMgdyC8FxUDuoMCb1vPAPRQPnYNidmcA7H5EySY=;
Received: from crapouillou.net ([89.234.176.41])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jssZp-00DTeS-Pr
 for kgdb-bugreport@lists.sourceforge.net; Tue, 07 Jul 2020 18:44:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1594146390; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQRrwbfO2C4Em9LcWxXzackWTr0tQ5tvZFSRH8pCMe0=;
 b=XzeBLZZpNrTe4Ra4qa9YkMqrcWIB6zuFg4aTH2C2kEQMTtyYB4q4KtKp/VYw3wfurq1Kn0
 L6vYSsxjiaskMjz36Jsy2DP+Y8oQPXQCS6J5S08kAw61Tz2Iuu7CBHExV7HzjcpUKs4626
 7D3ppRB7tG00QbsRFF8yeJYYsJftnrw=
Date: Tue, 07 Jul 2020 20:26:10 +0200
From: Paul Cercueil <paul@crapouillou.net>
To: Randy Dunlap <rdunlap@infradead.org>
Message-Id: <M734DQ.WGKQZ628NBB1@crapouillou.net>
In-Reply-To: <20200707180414.10467-14-rdunlap@infradead.org>
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-14-rdunlap@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: franken.de]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jssZp-00DTeS-Pr
X-Mailman-Approved-At: Wed, 08 Jul 2020 13:09:06 +0000
Subject: Re: [Kgdb-bugreport] [PATCH 13/20] Documentation: mips/ingenic-tcu:
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

Le mar. 7 juil. 2020 =E0 11:04, Randy Dunlap <rdunlap@infradead.org> a =

=E9crit :
> Drop the doubled word "to".
> =

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  Documentation/mips/ingenic-tcu.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> --- linux-next-20200701.orig/Documentation/mips/ingenic-tcu.rst
> +++ linux-next-20200701/Documentation/mips/ingenic-tcu.rst
> @@ -5,7 +5,7 @@ Ingenic JZ47xx SoCs Timer/Counter Unit h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

>  The Timer/Counter Unit (TCU) in Ingenic JZ47xx SoCs is a =

> multi-function
> -hardware block. It features up to to eight channels, that can be =

> used as
> +hardware block. It features up to eight channels, that can be used as
>  counters, timers, or PWM.
> =

>  - JZ4725B, JZ4750, JZ4755 only have six TCU channels. The other SoCs =

> all




_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
