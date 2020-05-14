Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC27D1D369C
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 14 May 2020 18:36:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jZGqu-0001bD-Ov
	for lists+kgdb-bugreport@lfdr.de; Thu, 14 May 2020 16:36:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1jZGqt-0001b3-GW
 for kgdb-bugreport@lists.sourceforge.net; Thu, 14 May 2020 16:36:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v6C8z0rXxDUkjhuwFuFnt2uOPwHgEk6nn1TUBgnw0hs=; b=PQ/XyLEPnsmAzYOSQjm2SvWjyr
 RSJJkaRLqnxasUhqjI5Tv9bDtPnZmCbU4vYZfSkXY7rJOjDrTpBwm6bRwVnUVcG5cr/RDsvV2rToy
 Zy1h+H298WXi3Q8ikWVnaEGUSqRgQLVUBJRTc4tleqwtvtjPKt1G3I0dlMf4Jk1E27MM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v6C8z0rXxDUkjhuwFuFnt2uOPwHgEk6nn1TUBgnw0hs=; b=EyX+pyI44WV6tWSRGycniYsCbb
 TFrFcrHy+rsVvu9uOmHZLg5Ki9ZgabUJAh8hXdBkxa3pQX3tunXCbToWPINMrW3RUsb3HuWQ+Q0Ex
 O6tfijLlcEvv6lrmiBBd0+DjlP6avKf+kFiGvprZK+GLG9XtppSOfMZsQlfsS37AwQxM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jZGqm-00FlaM-BI
 for kgdb-bugreport@lists.sourceforge.net; Thu, 14 May 2020 16:36:55 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB5F220675;
 Thu, 14 May 2020 16:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589474195;
 bh=/Oud4+Cb5VEN+0rjyvNjdi0y40dgg0LowyeDFy6iBQM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wlserAR3KAJqd5xHY94MD8nIrVksbeDqOZ15lIrwLhDydAbHRrjPzYK1z2GmIDIff
 Nty/yTzlxgyCM94tWna6ZmJT4C7xT+pZCPw7JdJoMqK3Cc6RBmnfgu1oiBM+lCS2gj
 q4TNirepiFdHOwljbHbA7YMdvPzupJFclkt+QGDY=
Date: Thu, 14 May 2020 18:36:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20200514163633.GA3154055@kroah.com>
References: <20200507200850.60646-1-dianders@chromium.org>
 <20200514162109.6qt5drd27hpilijh@holly.lan>
 <CAD=FV=X+t_Wg5KadZBTGHMSEXY3c-t6DZAtdaLXys31QJJpGGA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=X+t_Wg5KadZBTGHMSEXY3c-t6DZAtdaLXys31QJJpGGA@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZGqm-00FlaM-BI
Subject: Re: [Kgdb-bugreport] [PATCH v4 00/12] kgdb: Support late serial
 drivers; enable early debug w/ boot consoles
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 jinho lim <jordan.lim@samsung.com>, Andy Gross <agross@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Dave Martin <Dave.Martin@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jiri Slaby <jslaby@suse.com>,
 Alexios Zavras <alexios.zavras@intel.com>, bp@alien8.de,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Allison Randal <allison@lohutok.net>, Juergen Gross <jgross@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, May 14, 2020 at 09:34:26AM -0700, Doug Anderson wrote:
> > (though we must keep
> > changes to drivers/tty/serial/kgdboc alongside the kgdb changes).
> >
> > I can hoover them up but I'd need a solid set of acks and
> > I don't think we've got that yet.
> 
> It would be nice for it to be explicit, but "get_maintainer" says that
> Greg KH is the maintainer of serial drivers.  Git log confirms that he
> also has been the one landing changes to these files.  Early-on he
> provided his Reviewed-by for the series as a whole, so he's aware of
> it and maybe would be fine w/ the serial changes landing through the
> kgdb tree?
> 
> Greg: is that correct?

I have no objection for all of these to go through any other tree that
wants to take them :)

But if you want me to take them in the serial tree, to make it easier
for you or any other serial driver issues, I will be glad to do that,
just send them my way.  It's your call.

thanks,

greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
