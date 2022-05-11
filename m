Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0393A522C9C
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 11 May 2022 08:50:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nogB4-0004hd-2H
	for lists+kgdb-bugreport@lfdr.de; Wed, 11 May 2022 06:50:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <gregkh@linuxfoundation.org>) id 1nogB2-0004hX-M4
 for kgdb-bugreport@lists.sourceforge.net; Wed, 11 May 2022 06:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:List-Id:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zSCAciYqXiV0nEHwnehzGStl55NIjJGwWztk31C1FVc=; b=cHWlT2D7p53Vs0rnVJdWfajY8u
 Iwr6+LKZRBnWkw5Kznl49QtSVe6aujglOPVBKM6nTcyALH85SD6wnoVJ5SJ6blIWSnRCOVawSucVl
 SpaBfdC6E9C2kCEzDh/4KhKjbilTSqfDGkk5UiyBHIBjbSQDzH7TD4v+gHa0B4TqI9fA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:
 List-Id:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zSCAciYqXiV0nEHwnehzGStl55NIjJGwWztk31C1FVc=; b=R
 O4pkYHmc1J1O8sCc/nPqFGbWxTKqfMC5Fi/PnQ+ZasElpZi1+xN1ZN6Z7QNhiNm+P1ZX037uWHSVE
 RzSZmFZ4o22+fASHabNo2t8TIqHvLeZQJZ60XwFSu85vD/mCGzYe0cmQoaK5w5I7tyeAXsiOHtnBW
 j2Tya5Fzm7VX0klA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nogAz-0004N5-W9
 for kgdb-bugreport@lists.sourceforge.net; Wed, 11 May 2022 06:50:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4B554B8200B;
 Wed, 11 May 2022 06:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C33C385DE;
 Wed, 11 May 2022 06:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1652251810;
 bh=oabWsuyWgJhDY5KMYDv/hOs79hVOh8hDpnf427Xsi/8=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=eX8ZyCdm3ekZWZ7y6GzsIWhajRP5spKidB+tKIEeOvAPh+Imr7Fasx+jAFC7k/2+V
 nsWE5Ag4PWBe4oSQGvsr4CUzWlXuYftWQTr/0nCO5+8PA83OMw1qHJyZz/XEA2JoO0
 BXtktUgd2a0a9ViZ0NR3XMPi2aBIOG5AjsT+Y1Ck=
Date: Wed, 11 May 2022 08:50:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
Message-ID: <Yntcn4esjJRS50Am@kroah.com>
References: <20220511062113.2645747-1-hasegawa-hitomi@fujitsu.com>
 <20220511062113.2645747-2-hasegawa-hitomi@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511062113.2645747-2-hasegawa-hitomi@fujitsu.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 11, 2022 at 03:21:13PM +0900, Hitomi Hasegawa
 wrote: > Enable diagnostic interrupts for the Fujitsu A64FX. > > Register
 the NMI/IRQ corresponding to the A64FX's device definition > dedicat [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nogAz-0004N5-W9
Subject: Re: [Kgdb-bugreport] [PATCH v4 1/1] soc: fujitsu: Add A64FX
 diagnostic interrupt driver
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
Cc: daniel.thompson@linaro.org, arnd@arndb.de, peterz@infradead.org,
 catalin.marinas@arm.com, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, soc@kernel.org, linux-serial@vger.kernel.org,
 jason.wessel@windriver.com, olof@lixom.net, jirislaby@kernel.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, May 11, 2022 at 03:21:13PM +0900, Hitomi Hasegawa wrote:
> Enable diagnostic interrupts for the Fujitsu A64FX.
> 
> Register the NMI/IRQ corresponding to the A64FX's device definition
> dedicated to diagnostic interrupts, so that when this interrupt is
> sent using the BMC, it causes a panic. This can be used to obtain
> a kernel dump.
> 
> Signed-off-by: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
> ---
>  MAINTAINERS                      |   5 +
>  drivers/soc/Kconfig              |   1 +
>  drivers/soc/Makefile             |   1 +
>  drivers/soc/fujitsu/Kconfig      |  13 +++
>  drivers/soc/fujitsu/Makefile     |   3 +
>  drivers/soc/fujitsu/a64fx-diag.c | 155 +++++++++++++++++++++++++++++++
>  6 files changed, 178 insertions(+)
>  create mode 100644 drivers/soc/fujitsu/Kconfig
>  create mode 100644 drivers/soc/fujitsu/Makefile
>  create mode 100644 drivers/soc/fujitsu/a64fx-diag.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cd0f68d4a34a..dc35c81ba917 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -241,6 +241,11 @@ F:	include/trace/events/9p.h
>  F:	include/uapi/linux/virtio_9p.h
>  F:	net/9p/
>  
> +A64FX DIAG DRIVER
> +M:	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
> +S:	Supported
> +F:	drivers/soc/fujitsu/a64fx-diag.c
> +
>  A8293 MEDIA DRIVER
>  M:	Antti Palosaari <crope@iki.fi>
>  L:	linux-media@vger.kernel.org
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index a8562678c437..e10eb27e1e7e 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -9,6 +9,7 @@ source "drivers/soc/atmel/Kconfig"
>  source "drivers/soc/bcm/Kconfig"
>  source "drivers/soc/canaan/Kconfig"
>  source "drivers/soc/fsl/Kconfig"
> +source "drivers/soc/fujitsu/Kconfig"
>  source "drivers/soc/imx/Kconfig"
>  source "drivers/soc/ixp4xx/Kconfig"
>  source "drivers/soc/litex/Kconfig"
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index adb30c2d4fea..b12b0b03ad47 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_SOC_CANAAN)	+= canaan/
>  obj-$(CONFIG_ARCH_DOVE)		+= dove/
>  obj-$(CONFIG_MACH_DOVE)		+= dove/
>  obj-y				+= fsl/
> +obj-y				+= fujitsu/

Why a sub directory for just one .c file?

>  obj-$(CONFIG_ARCH_GEMINI)	+= gemini/
>  obj-y				+= imx/
>  obj-y				+= ixp4xx/
> diff --git a/drivers/soc/fujitsu/Kconfig b/drivers/soc/fujitsu/Kconfig
> new file mode 100644
> index 000000000000..e05c40725922
> --- /dev/null
> +++ b/drivers/soc/fujitsu/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menu "fujitsu SoC drivers"
> +
> +config A64FX_DIAG
> +	tristate "A64FX diag driver"
> +	depends on ARM64
> +	depends on ACPI
> +	help
> +	  Say Y here if you want to enable diag interrupt on Fujitsu A64FX.
> +
> +	  If unsure, say N.

You need to provide more information about what this driver does and
what it is here.

thanks,

greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
