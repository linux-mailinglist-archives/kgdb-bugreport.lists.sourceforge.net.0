Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 492354F98E1
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 Apr 2022 17:02:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ncq7v-00021L-8Q
	for lists+kgdb-bugreport@lfdr.de; Fri, 08 Apr 2022 15:02:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daniel.thompson@linaro.org>) id 1ncq7t-00021F-GP
 for kgdb-bugreport@lists.sourceforge.net; Fri, 08 Apr 2022 15:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iz+c1WD+2kFnJShyZVo2mhzJoonjpk5NKsWkeEnebGQ=; b=ID1L3o+xLN3GnGvxONs5vaPMGg
 aLd4fWyN2IUlZ4djRPwStjFkdz2vipKEGi+s93dw5fiHIkF+NeVRJDAmxOczgY8+VAzEtuRca6MsB
 CESccs2PwWyBAgzRFFpN9T7QSiT2KZVHfpfgfKI0jxrWchotGSLRqYTDKVP2BVcZvRiA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iz+c1WD+2kFnJShyZVo2mhzJoonjpk5NKsWkeEnebGQ=; b=Irsl44c+K2Zt3Gix7b4Ml7UEyZ
 IacEvHAXwPRS/0gzXiljvNL0e+rU6w39lS/PSl7XhVAOchuKRGrxDfTjxWzDDRQuRwkgkCjNqP5cv
 zG7KJ6rHbVjFinlpvHuqcd7ZVZD1Bdg065kYceDNKKwVgu52Hdtz2aLx9+FKqR4Ob4i4=;
Received: from mail-wm1-f48.google.com ([209.85.128.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1ncq7n-0003ks-Ve
 for kgdb-bugreport@lists.sourceforge.net; Fri, 08 Apr 2022 15:02:15 +0000
Received: by mail-wm1-f48.google.com with SMTP id r64so5667139wmr.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 08 Apr 2022 08:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iz+c1WD+2kFnJShyZVo2mhzJoonjpk5NKsWkeEnebGQ=;
 b=y9ibWseywVkczs7jv5ix8tRuxiKUjgfy4DezaUm/nwfvBNH2KSmqMIZdDbd9Mxvv7Q
 7d6lbxe8qJxKshaiQTWrOHkXpVrOESzVp7N88yLH8SVEFx/tMn+C5FvL9SQuW4Ay3+Yg
 kSi8XOTA4wjkMuNLadheSj28sSDK5z38Ee1DcrcVQbj2Tp4RAw4jX4mO4u8u3PotdWP+
 4rwzqeiKpc/NRLnCjb7gzfPM5Xo+lIiaadoAqFt2SGcXiW6HFApmYmbg1YR/aTboB9b0
 pvDHwdri2n3mKhUfpnyIMM/KIZc/KMielcqidnee3d1WMhqUTDnXHyblKRaaoaI47zkA
 ekMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iz+c1WD+2kFnJShyZVo2mhzJoonjpk5NKsWkeEnebGQ=;
 b=x8r+PkFjAWpQjqtdNNu11rpt7QuEf20Or3AZLd3BARHdcP3K6PgMgo6syGZ/BiPGdP
 hdTlmxdvS48qfj7gkuYB5uPOhKaxfuuQKLWosZeBbRod8FPFo0w+Y8mLdT60EY7HZeZ6
 cf+J/Xv4mgt1llIWBbytZeBNlBAeLOYWPUxv6xX5qg3Pn/gnQrJZN5FcWOTn9kD5o2tE
 EqR8/UGAN+jHPcahWWV7f9rk48N7L4SmwDWX5hhvUi3iLCIIRmm07rhgSZqZ5AjfeBEc
 nqcj2sTvMGDsLhZT26kyRneyWcXWW2uHzdxC5tBtx6V0JOgG/yNZ/XLZK1DY6o4eOBWD
 rCCA==
X-Gm-Message-State: AOAM533mJRzIMjyye1UbT7o13JazmN3zB6G6w1imEZIAyMmY7wlb/JtD
 m7we7u12I+SzjxWrmrxneYbQKQ==
X-Google-Smtp-Source: ABdhPJySCidxaQPfz8lG3tCiCVWv3xpUiU9+LN8RUHhf594sVG3Xhb9svnvuZsqc2c0PWxIs36RpWA==
X-Received: by 2002:a7b:ce84:0:b0:37c:52fe:a3ff with SMTP id
 q4-20020a7bce84000000b0037c52fea3ffmr17153661wmj.48.1649430125474; 
 Fri, 08 Apr 2022 08:02:05 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 f13-20020a5d64cd000000b0020787751295sm4287477wri.35.2022.04.08.08.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 08:02:04 -0700 (PDT)
Date: Fri, 8 Apr 2022 16:02:02 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20220408150202.yhn3qppqwm7wzmo3@maple.lan>
References: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
 <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com>
 <YkWVTEG5oFO82GPL@kroah.com>
 <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>
 <20220408133246.fyw5554lgli4olvg@maple.lan>
 <CAK8P3a0u2xa9BFmakG+f4kyLsqNZQbE6KQ6jz2356Fyen=1EHw@mail.gmail.com>
 <YlBE6hZHmLo9/wrU@kroah.com>
 <CAK8P3a3v4+AO5avGoxeZSyNTOWqk8YS95xQLWSBZ=yV_3DKggg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3v4+AO5avGoxeZSyNTOWqk8YS95xQLWSBZ=yV_3DKggg@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Apr 08, 2022 at 04:49:31PM +0200,
 Arnd Bergmann wrote:
 > On Fri, Apr 8, 2022 at 4:21 PM Greg KH <gregkh@linuxfoundation.org> wrote:
 > > > > On Fri, Apr 08, 2022 at 04:17:16PM +0200, Arnd Bergm [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.48 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.48 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1ncq7n-0003ks-Ve
Subject: Re: [Kgdb-bugreport] [PATCH v3 1/1] soc: fujitsu: Add A64FX
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
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 kgdb-bugreport@lists.sourceforge.net, Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Greg KH <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mike Travis <mike.travis@hpe.com>, SoC Team <soc@kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Apr 08, 2022 at 04:49:31PM +0200, Arnd Bergmann wrote:
> On Fri, Apr 8, 2022 at 4:21 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Apr 08, 2022 at 04:17:16PM +0200, Arnd Bergmann wrote:
> > > On Fri, Apr 8, 2022 at 3:32 PM Daniel Thompson
> > > <daniel.thompson@linaro.org> wrote:
> > > > On Thu, Mar 31, 2022 at 05:44:55PM +0200, Arnd Bergmann wrote:
> > > >
> > > > There is some prior art for this sort of feature. AFAICT SGI UV has a
> > > > similar mechanism that can send an NMI-with-no-side-channel to the
> > > > kernel. The corresponding driver offers a range of actions using a
> > > > module parameter:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/platform/uv/uv_nmi.c#n180
> > > >
> > > > I don't think a hardcoded 'c' makes any sense. With a hardcoded argument
> > > > it is just obfuscation. However it is certainly seems attractive to be
> > > > able to reuse handle_sysrq() to provide a more powerful set of actions.
> > >
> > > How about a module parameter that allows picking a sysrq character then?
> >
> > Module parameters are so 1990, as this is a platform device, why not get
> > it from DT?
> 
> This machine doesn't use DT. I suppose the same could be done with an EFI
> variable, but with a module parameter you get the added benefit of having both
> a boot time kernel command line argument, and the option to override it at
> run time.

Pushing the decision on what action to take into firmware (whether that
is DT or ACPI) implies that the firmware is well positioned to make a
decision.  I don't think that is true here.

To me, it seems more like an admin choice... and admins are conditioned
to use kernel arguments.

If these type of diagnostics request were more common then perhaps we'd
be looking at a sysctl and call to handle_diagnostic_sysrq().


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
