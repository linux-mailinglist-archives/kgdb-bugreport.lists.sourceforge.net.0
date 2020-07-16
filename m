Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66565221D64
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Jul 2020 09:28:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jvyJx-0008Uz-3C
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Jul 2020 07:28:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1jvyJv-0008Uq-4j
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 07:28:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6PtIUf1+alpnFJYsn4lwSwRySBCnkZV63pcf4pctVxI=; b=HDFB9D5wT89iwdHAPWXy8VBgpP
 dRzS8yrr/UfJOHy/iCOhKTBCxiWGe2VdPE0d9kk3B1T87gNLZamUUNzfsvmVCt0klX51j6pq/vdWA
 RXF/1WwzQAh2GS7KgGS8B1LzedD9Q1SnfThyHYpq8LQxGK7nuH8rYsOQlmVFqmB+X+m8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6PtIUf1+alpnFJYsn4lwSwRySBCnkZV63pcf4pctVxI=; b=fyqd9u2Eyffwc76g4kfMQ0gVmJ
 kxV07TECah45KEbewcrOkoVodJ3r/du9hfDy7fJfB9jjPUeNdqpByvgKkF9bAlcp5UsfltWfOnvAN
 II2NrsTKt3WvxuCCUpKy6TQSpW/ztHmDtapdk9OBY0iL9EgWMyi8BN8bYtQxagXq4ytg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jvyJm-005Qft-Ie
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 07:28:43 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B91CC206C1;
 Thu, 16 Jul 2020 07:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594884509;
 bh=SYcdFaf5HdYrp6/CLmW/0Fkwx9KixuSorUJatgNzvIA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ci71ZpD5S3+QhU/29ZLHmt6sx6CHBBFOvDFGEc8Idi+NVP4ztq8BTut8v79F9OD0a
 UNWgcmqvc5YkyJIBSmdbiNaQ0EhtbhDfD/Du94wgViUkTHqT2jJuQZITVXgcpgrtnT
 5bChNpquKrkCX06aKWC/AAixLbvSh2ng4sGsm3aI=
Date: Thu, 16 Jul 2020 09:28:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Message-ID: <20200716072823.GA971895@kroah.com>
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716030847.1564131-2-keescook@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716030847.1564131-2-keescook@chromium.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jvyJm-005Qft-Ie
Subject: Re: [Kgdb-bugreport] [PATCH 1/3] usb: gadget: udc: Avoid tasklet
 passing a global
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
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Oscar Carter <oscar.carter@gmx.com>, Mitchell Blank Jr <mitch@sfgoth.com>,
 kernel-hardening@lists.openwall.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Christian Gromm <christian.gromm@microchip.com>,
 Kevin Curtis <kevin.curtis@farsite.co.uk>, Will Deacon <will@kernel.org>,
 devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Julian Wiedmann <jwi@linux.ibm.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>, Jiri Slaby <jslaby@suse.com>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Wambui Karuga <wambui.karugax@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-input@vger.kernel.org,
 Ursula Braun <ubraun@linux.ibm.com>, Stephen Boyd <swboyd@chromium.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Felipe Balbi <balbi@kernel.org>, Kyungtae Kim <kt0755@gmail.com>,
 netdev@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Allen Pais <allen.lkml@gmail.com>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 Karsten Graul <kgraul@linux.ibm.com>, Romain Perier <romain.perier@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Jul 15, 2020 at 08:08:45PM -0700, Kees Cook wrote:
> There's no reason for the tasklet callback to set an argument since it
> always uses a global. Instead, use the global directly, in preparation
> for converting the tasklet subsystem to modern callback conventions.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/usb/gadget/udc/snps_udc_core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/snps_udc_core.c b/drivers/usb/gadget/udc/snps_udc_core.c
> index 3fcded31405a..afdd28f332ce 100644
> --- a/drivers/usb/gadget/udc/snps_udc_core.c
> +++ b/drivers/usb/gadget/udc/snps_udc_core.c
> @@ -96,9 +96,7 @@ static int stop_pollstall_timer;
>  static DECLARE_COMPLETION(on_pollstall_exit);
>  
>  /* tasklet for usb disconnect */
> -static DECLARE_TASKLET(disconnect_tasklet, udc_tasklet_disconnect,
> -		(unsigned long) &udc);
> -
> +static DECLARE_TASKLET(disconnect_tasklet, udc_tasklet_disconnect, 0);
>  
>  /* endpoint names used for print */
>  static const char ep0_string[] = "ep0in";
> @@ -1661,7 +1659,7 @@ static void usb_disconnect(struct udc *dev)
>  /* Tasklet for disconnect to be outside of interrupt context */
>  static void udc_tasklet_disconnect(unsigned long par)
>  {
> -	struct udc *dev = (struct udc *)(*((struct udc **) par));
> +	struct udc *dev = udc;
>  	u32 tmp;
>  
>  	DBG(dev, "Tasklet disconnect\n");

Feel free to just take this in your tree, no need to wait for the USB
stuff to land.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
