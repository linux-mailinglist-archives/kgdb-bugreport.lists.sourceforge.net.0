Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E432EAA78
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  5 Jan 2021 13:10:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kwlAe-0000e7-Vt
	for lists+kgdb-bugreport@lfdr.de; Tue, 05 Jan 2021 12:10:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kwlAd-0000di-En
 for kgdb-bugreport@lists.sourceforge.net; Tue, 05 Jan 2021 12:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w/LNxQYo7eFw62PeVBmCU+ZqioIR6+rqH3T9Kp8E1Rk=; b=Yzs04QEU2M+0utfxokCfx9xAPf
 te1h22eOz77AuCGKFm4aow0I6xkrofCjXaCRdGMcmYSln5BXUavYniU+ogYM73xoxWiYT7+T9IN/o
 OTTKHZYtIYY1sKj8mCmsL/fYTdzpntmIo6J3ZaI6yew7HpnTyKSMQhpruQcYEq8p7SVY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w/LNxQYo7eFw62PeVBmCU+ZqioIR6+rqH3T9Kp8E1Rk=; b=fDl9h4O7IEZ4aYjg6yMSQeZq67
 cUANjgNcjtGH7PcpgQCLrC83Eoe8U0oP0Goilxwh+BpxN/oqCkdxWJGkrJOp+MFXvOYuNmDQW9Y3A
 aK8qc7G0/QhwAufPBmXbRXdTwxUDlVwaYpZ1CeggaRBRRP+3vkTvTAk+MVptM3oZGmXw=;
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kwlAX-00A96a-8y
 for kgdb-bugreport@lists.sourceforge.net; Tue, 05 Jan 2021 12:10:39 +0000
Received: by mail-wr1-f46.google.com with SMTP id r3so35976659wrt.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 05 Jan 2021 04:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=w/LNxQYo7eFw62PeVBmCU+ZqioIR6+rqH3T9Kp8E1Rk=;
 b=GfFrgFwo7K6mL7ERerzwa9c74szmJvg5cqFdGkn0y+szm16+LdM8WCFLoGYIrqgiO3
 MZb/7MKvhdPkLT+VhIVV9bUGvJ3X8cA179Aerf0vKNwKwoDRoni76pNSvN0PyaUqcOdO
 6Prv+p9XWQNvMjrs4KG6MnLxpqbhiG4Huz1bn/K2VZATgea76N9LhF/5/kt+8MJRZlvQ
 JC7NzcaOqyU8bhAYh3LwRIH8GzHQAGdmOrNR8WRbFNG3phNAf6nEF6JuJKwsy/yAqQw7
 7rnGHmgghudMHn41tQKWhKBIRIRr0r6mrSTTFcvpiiEx2/IFzYbyFemXtd4e48mxU1oV
 S3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w/LNxQYo7eFw62PeVBmCU+ZqioIR6+rqH3T9Kp8E1Rk=;
 b=NzLW2abkjy5x4YSGS2XzQdMY5OkMqV/pJAwOSIdVSrSSUEGDGX6i28Et00siDAk78+
 zy5aCqHUcHkchxQrCO2YURd8mN3Q5wACuy5zfzxmKwrVzcMlZjH08JKwZaGIQVjkXfkc
 S1rRhQuvvjE1KnMiXWOPTg8i2TwK6ZVhB5Wi1VH3RExel99eQNm8CILwTCOZWMpC/Ox3
 z7lrcn0uRujwLeAfDUFWkUQRAGUlk5f/QGwbn4eektWLY0PyvSPSOq6cWN4iAfwMz8DO
 U9GbM4/HqR9aTVdIcLWCZGX5aZJKXnpE/gAtnhZJ6TkF/Lagngr5Rxu9YrHkBjSeAPAU
 m9yQ==
X-Gm-Message-State: AOAM532di+2mn9Zh0osJV0KxybcSvJvmSc8EDR9aYC9Nx/4I3c4hDD4p
 3Xa5QY7X3SMSrYZ2F5dcWhLu/Q==
X-Google-Smtp-Source: ABdhPJyCrWMTX9GvfqIXK0HNVEPld8L5WvDTq2gC5SWGFAtZpt0uZeG++Eyxkx183tF/nRwIByzpvQ==
X-Received: by 2002:adf:8342:: with SMTP id 60mr85221779wrd.140.1609848619088; 
 Tue, 05 Jan 2021 04:10:19 -0800 (PST)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id w17sm4068352wmk.12.2021.01.05.04.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 04:10:18 -0800 (PST)
Date: Tue, 5 Jan 2021 12:10:16 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: bodefang <bodefang@126.com>
Message-ID: <20210105121016.ritlzseyjprh5rhg@holly.lan>
References: <1609120738-202321-1-git-send-email-bodefang@126.com>
 <20210104112854.fghr32y37mzw6fpb@holly.lan>
 <279df92c.1b26.176d0907b64.Coremail.bodefang@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <279df92c.1b26.176d0907b64.Coremail.bodefang@126.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.46 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.46 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kwlAX-00A96a-8y
Subject: Re: [Kgdb-bugreport] [PATCH] kgdbts: Passing ekgdbts to command
 line causes panic
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
Cc: arnd@arndb.de, kgdb-bugreport@lists.sourceforge.net,
 jason.wessel@windriver.com, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Please avoid top posting. Threads on LKML are typically presented as
follows.

On Tue, Jan 05, 2021 at 11:21:38AM +0800, bodefang wrote:
> At 2021-01-04 19:28:54, "Daniel Thompson" <daniel.thompson@linaro.org>
> wrote:
> >On Mon, Dec 28, 2020 at 09:58:58AM +0800, Defang Bo wrote:
> >> Similar to commit<1bd54d851f50>("kgdboc: Passing ekgdboc to command
> >> line causes panic"), kgdbts_option_setup does not check input
> >> argument before passing it to strlen.  The argument would be a NULL
> >> pointer.
> >
> > Something seems to be missing here.
> >
> > The ekgdbts parameter mentioned in the subject line doesn't exist so
> > how can including it on the kernel command line could provoke a
> > panic.
> >
> > Please can you share the kernel boot arguments you used when you
> > tested this patch?
>
> I use static analysis tool to find these funcs are similar to the
> commit<1bd54d851f50>(kgdboc: Passing ekgdboc to command line causes
> panic), so it's just defensive, I haven't actually hitted this but
> there actually seems a problem here.

I don't see how a problem that occured when ekgdboc is parsed can occur
because this module does not parse ekgdbts! Are there really any
circumstances where kgdbts_option_setup() can be called with a NULL
argument?


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
