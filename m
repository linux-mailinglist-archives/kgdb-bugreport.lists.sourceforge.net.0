Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2273A243859
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 13 Aug 2020 12:17:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k6AIX-0000i5-Th
	for lists+kgdb-bugreport@lfdr.de; Thu, 13 Aug 2020 10:17:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1k6AIW-0000ht-Lp
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 Aug 2020 10:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2Jksw957ApTEUdNh+WJ+SMHxYZwMIbppobCvjvmWoFY=; b=G/3zw6nATlqjziOfSrTKoZfWv2
 ZeCvrmO65TwOV3zAF80v1HPaHNBbQDTOXzU4xC2nNmohdaFpDy4AkH+aQ7jeW8HH27fL4KkVnERQE
 K4JFH+3+7NssS0i6wzmYRv6WkU0QK/gDltb38p6Np6Ccsp1vH+uRB0cNeurZrJy/bzLM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2Jksw957ApTEUdNh+WJ+SMHxYZwMIbppobCvjvmWoFY=; b=A9uVAhMJUUPg5bB3XsQXdoUcfh
 /BtpJ90jRBRc8tis6434eCASbLWnHi4i3eY2APXmeJz7m2ZSB1U0SrkwvGrb4eNoBo5ZH4SvxaReE
 oExVY5EVnijofewAvuH7PFK0xIPa5bQUSrpX2ek/mPd+NVE1AK3JDNaUkvHLZREqtDPw=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k6AIS-00C0Ba-Ah
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 Aug 2020 10:17:24 +0000
Received: by mail-wr1-f68.google.com with SMTP id a5so4747187wrm.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 13 Aug 2020 03:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2Jksw957ApTEUdNh+WJ+SMHxYZwMIbppobCvjvmWoFY=;
 b=QN4Bkr8TeVYbJBa6MMwSkHdWx/riEzXkTnXVWpsIjsobcal0reicM/9cElmteR8CUR
 /EeCa6G2bsbzJPjwoeml1DGIKdysExzQTvmpAO3tJxEadzy07Kyl0OrWt34BveGxpbIa
 pJxzcHfIRsTVkG1AeW+Vxmp4nCikq3LLySOcccSgz2yn7d30CAQsRcq8i01d4yWQ8U80
 h3DABNX66w5Kmr8cPnnwVn9nHK2hAjSE335SQ8hbx1k4xN57qxfTqt3H2PwK2waeOFQO
 zyWA7aeBEYDhqELGCny4UBg58sTufYumo6cRL7pFiNZLNVueGYZunkoYIX1iD90FWO+7
 6L0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2Jksw957ApTEUdNh+WJ+SMHxYZwMIbppobCvjvmWoFY=;
 b=nDyymgJz124dvJuDeOAvfIIhkJuowNtS6ao9Tg2uWqYCIE9yW7rFA5Un1SA6YZFvKT
 y+cxxIiH9/vvdSRx6zIOxL7jlijT/EYZ+jcyhGDDY5IMmnv8+fHB50ZDZ+eEOtWSQBFp
 Hj/92kzoDvQ/Xdcx9wsC6OoaP2i3zaFXvV0f6NaCSchJFgUX0XKaHH02d5R5vKu2oQBq
 2/2Grdab4d2DzsyGZ8st9TaWa8y6oZRvTLHe8eWw+/2/cES0EbUobYnNu3LrFVCUtl1C
 iSGQMg2vxnE7tRubSDI0PZPSygIq8SsoIZhC/v0jsrXRtCqQZhICyB4FDtHXEnro+Xtb
 y64Q==
X-Gm-Message-State: AOAM533Ni9FnV0Il3s87jZpibg1sWJJ8rqOLomwhzcaTkk2VWUqtrzfA
 rALRuLe3q5Kh1ejbTwjsttYqRA==
X-Google-Smtp-Source: ABdhPJz31vqukdsdocXiZ3R5woRV0W54AJOsLQCkCk6VzoTnkJcBkq16BiBZJAsfLjdST1/6ACkqhg==
X-Received: by 2002:a5d:51c3:: with SMTP id n3mr3220762wrv.387.1597313826743; 
 Thu, 13 Aug 2020 03:17:06 -0700 (PDT)
Received: from holly.lan (82-132-221-219.dab.02.net. [82.132.221.219])
 by smtp.gmail.com with ESMTPSA id m1sm8647311wmc.28.2020.08.13.03.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 03:17:06 -0700 (PDT)
Date: Thu, 13 Aug 2020 11:17:03 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20200813101703.566thqmnc2d7cb3n@holly.lan>
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <CAFA6WYMN=na4Pxnu1LYRVAAZRdV==5EwU-Vcq-QkRb_jaLiPmw@mail.gmail.com>
 <20200811135801.GA416071@kroah.com>
 <CAFA6WYMN8i96rEZuHLnskB+4k0o=K9vF1_we83P04h2BSoGjmQ@mail.gmail.com>
 <20200811145816.GA424033@kroah.com>
 <CAD=FV=UD=cTn6jwpYS-C-=1ORd-4azZ8ZiBR6om++2sMS1nmMg@mail.gmail.com>
 <CAFA6WYPBdOiVsKR_hSLpigN_1b9jimXKaqyRZjvKSx3xpAmLjA@mail.gmail.com>
 <CAD=FV=WccmFRkV4UUTLSYR9+7210h00Si=nG4tRs3BBuweA6ng@mail.gmail.com>
 <CAD=FV=V8UhQVQvcAp6XCmT3=6FYM=_zPELy4FTj4kMKUswaR8Q@mail.gmail.com>
 <CAFA6WYPxieH6ZTa_BFdaLuiwbqAs6r7eKmxG7ci4XtyRONGN7g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYPxieH6ZTa_BFdaLuiwbqAs6r7eKmxG7ci4XtyRONGN7g@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k6AIS-00C0Ba-Ah
Subject: Re: [Kgdb-bugreport] [RFC 0/5] Introduce NMI aware serial drivers
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Aug 13, 2020 at 02:55:12PM +0530, Sumit Garg wrote:
> On Thu, 13 Aug 2020 at 05:38, Doug Anderson <dianders@chromium.org> wrote:
> > On Wed, Aug 12, 2020 at 8:27 AM Doug Anderson <dianders@chromium.org> wrote:
> > > One
> > > last worry is that I assume that most people testing (and even
> > > automated testing labs) will either always enable NMI or won't enable
> > > NMI.  That means that everyone will be only testing one codepath or
> > > the other and (given the complexity) the non-tested codepath will
> > > break.
> > >
> 
> The current patch-set only makes this NMI to work when debugger (kgdb)
> is enabled which I think is mostly suitable for development
> environments. So most people testing will involve existing IRQ mode
> only.
> 
> However, it's very much possible to make NMI mode as default for a
> particular serial driver if the underlying irqchip supports it but it
> depends if we really see any production level usage of NMI debug
> feature.

The effect of this patch is not to make kgdb work from NMI it is to make
(some) SysRqs work from NMI. I think that only allowing it to deploy for
kgdb users is a mistake.

Having it deploy automatically for kgdb users might be OK but it seems
sensible to make this feature available for other users too.

Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
