Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E271D947B
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 19 May 2020 12:37:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jazd6-0006Al-Qw
	for lists+kgdb-bugreport@lfdr.de; Tue, 19 May 2020 10:37:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jazd5-0006AQ-GB
 for kgdb-bugreport@lists.sourceforge.net; Tue, 19 May 2020 10:37:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nJqGHCLYRoZ39Y3LPONsDokd1MQBpWuhJuodhCCoySM=; b=PjP68l5nBvou0yRgsio37whQsD
 uWpPnJ75RZqkdSjXm63cc+9feVP6hYPgKNzndmz42IqVR7N/hA2/G18wpJQasgs2LzqUsPfbbZcrZ
 UwBApRzw5p7iPva0ABhKjeRV9lshb6G892J+fUZlJonpHWQB8g8toJaU2SzEvm3R0MfE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nJqGHCLYRoZ39Y3LPONsDokd1MQBpWuhJuodhCCoySM=; b=hYaTsth+yZeOTdwvBwTPkFrb6J
 lVen85/enB0754tX2OQfJzldfmR9JNtXQSfhlxoAPmSZXv/qIrX04u6eRVePBIXDXpb7kwZSOj41I
 9BaxJYrjbdFFY0HApXOnc29+PJJ541JBjEOtrTqf8to4HXPyPNFE2ag00dGqXWfl4AbA=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jazcz-007Dhv-FF
 for kgdb-bugreport@lists.sourceforge.net; Tue, 19 May 2020 10:37:47 +0000
Received: by mail-wm1-f68.google.com with SMTP id u188so2938932wmu.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 19 May 2020 03:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nJqGHCLYRoZ39Y3LPONsDokd1MQBpWuhJuodhCCoySM=;
 b=YMdHV7z6BExIROOjIpfvHwSUNwtHyJyHxewUmgQ58pFt2DCJ+Uq3LE6nN5u01qIsPB
 rTnMHvOJ4foaIZQznr6Ev5x+fowQs8Joohvex2NOX8e3CLiyut/6ZWwYdeVM/Lpn+uJg
 PuZjzzrw1kE6Klbf6tp/7LgGBpx+RxVYgAqJ89o4oQgPzP3JodvHnPd1rK6Uid0Y1CS1
 BSRg+2wxS7OWx3hF4QjrYSYrrMdaEWoA68ZfdaWbMNbSyMgwx4PDx1Ism+F2DODBpig5
 zZiibs5LM8fN32E7W8maiyUmM7xI44L6S6gQCO8h07GklbCW+XXxkrZ7CLC5GYdp0UmA
 19Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nJqGHCLYRoZ39Y3LPONsDokd1MQBpWuhJuodhCCoySM=;
 b=fqF4sgd5rgoxH2WE81BczaNNIyu9uVveuK+9TDwys1fvFAMVmgdoEd2UT2W945+jQi
 fhzrgEzLNVaCNdrvnYi0cH9PQNb7owouyPOmOINM3fD9uNlIwhaFfR5c3Vj0PUGtwC+W
 8utA2SCK7WbpBScBtt4lkuPMtosAtbiKqapaVad+5Kv7iesQ9IbovoJQzpnA8J2PAxbY
 8v0DhL/9JRm2tcZETJIDWojE1XQJOsSO5YaTcu8zL/OXdFA7sHjeshiGs820CKcuW7ZT
 FLY3blW8+W4H8lad2MxR/M721Yk/kLqh6LMnM0KOON/5wqmt6PPP8+SBAGaLVOR51dsi
 KSqw==
X-Gm-Message-State: AOAM530ltg8CxdloRlCgbypwmbXB/5xnJtN0RFlGFUaHvmSElyU0nRw3
 USEAk0ib9UjdiAfAyE3yoe2UUA==
X-Google-Smtp-Source: ABdhPJxj5fMEywwcRHjfOT2c3qwvdLgOyHayzX2tbuWzyAy4O/+p5lMYXda/U5svbychHMOWNGk9Ww==
X-Received: by 2002:a05:600c:1403:: with SMTP id
 g3mr4962732wmi.51.1589884647744; 
 Tue, 19 May 2020 03:37:27 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id x24sm21634435wrd.51.2020.05.19.03.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 03:37:27 -0700 (PDT)
Date: Tue, 19 May 2020 11:37:24 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20200519103724.eyabo2n4uzms25bp@holly.lan>
References: <20200507200850.60646-1-dianders@chromium.org>
 <20200514162109.6qt5drd27hpilijh@holly.lan>
 <CAD=FV=X+t_Wg5KadZBTGHMSEXY3c-t6DZAtdaLXys31QJJpGGA@mail.gmail.com>
 <20200514163633.GA3154055@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514163633.GA3154055@kroah.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jazcz-007Dhv-FF
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, jinho lim <jordan.lim@samsung.com>,
 Ingo Molnar <mingo@redhat.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Andy Gross <agross@kernel.org>, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Dave Martin <Dave.Martin@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jiri Slaby <jslaby@suse.com>,
 Alexios Zavras <alexios.zavras@intel.com>, bp@alien8.de,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Juergen Gross <jgross@suse.com>, LKML <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, May 14, 2020 at 06:36:33PM +0200, Greg Kroah-Hartman wrote:
> On Thu, May 14, 2020 at 09:34:26AM -0700, Doug Anderson wrote:
> > > (though we must keep
> > > changes to drivers/tty/serial/kgdboc alongside the kgdb changes).
> > >
> > > I can hoover them up but I'd need a solid set of acks and
> > > I don't think we've got that yet.
> > 
> > It would be nice for it to be explicit, but "get_maintainer" says that
> > Greg KH is the maintainer of serial drivers.  Git log confirms that he
> > also has been the one landing changes to these files.  Early-on he
> > provided his Reviewed-by for the series as a whole, so he's aware of
> > it and maybe would be fine w/ the serial changes landing through the
> > kgdb tree?
> > 
> > Greg: is that correct?
> 
> I have no objection for all of these to go through any other tree that
> wants to take them :)
> 
> But if you want me to take them in the serial tree, to make it easier
> for you or any other serial driver issues, I will be glad to do that,
> just send them my way.  It's your call.

Thanks. I've taken then via my tree.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
