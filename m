Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4039C1EC455
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  2 Jun 2020 23:32:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgEWN-00064A-2B
	for lists+kgdb-bugreport@lfdr.de; Tue, 02 Jun 2020 21:32:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jgEWL-000643-MJ
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Jun 2020 21:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NlyPlUpzi8PxJ6au1VoYObkQsvt6RuFDhAnnzvz4bv0=; b=ZxfVq98K3+beBOgc0q+gk3595Z
 4AXpzwqkzNgxcXCE47LcBYQVeeuQA3rfPIsJAjnNbKqXHQs0z+IgAl1R99PHwMUnEtnajCwGQmG5Z
 pyt92NU/oDv0LyGY9xcODUlwufGLxNTiJaLGTcRxBmvX9e6Ln4BksPrZ5KZp02e6st00=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NlyPlUpzi8PxJ6au1VoYObkQsvt6RuFDhAnnzvz4bv0=; b=AewlrsNhYZyzBEVn26qRCM/9DW
 w2OTSmRZJ5GdN/gNjddZF1eSpfZJqUBWrY5q4SzYYuLiwjFHnac1ABQgZ461qnuqDC3pFeFo65cDE
 jn6szgSQB4i5IKnKX5kZjsa7kMXgsPcOJx02q/odFyPwnRItCdahvecdOLmZEVMwxEDA=;
Received: from mail-vs1-f68.google.com ([209.85.217.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgEWK-0037UT-LI
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Jun 2020 21:32:29 +0000
Received: by mail-vs1-f68.google.com with SMTP id o2so173442vsr.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Jun 2020 14:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NlyPlUpzi8PxJ6au1VoYObkQsvt6RuFDhAnnzvz4bv0=;
 b=niGr0710a1CzJTTkAC1MviQRrhfyFb98xSRE+/esFIW4I7LWXcyfTIt2O9SmXR/yRZ
 RngJF2TxDpa6TPzdMv8y4O47Suo9Ujr1Op5mpSmlfbIGHJ5ASnRe+epOmQS1ieDhYz9V
 1zbBa+UdRxiiMIY5+1aNGrSDsITPGnZnfQS94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NlyPlUpzi8PxJ6au1VoYObkQsvt6RuFDhAnnzvz4bv0=;
 b=kNurxMs/VY1bR5Qq1ydUp2vmHtnJ3EVTG36DYKYO8dfsV1UTI7us4spxYMVGev81ji
 fhYjg03CDZ3F18BI83dVt+C7Xc3zfFDUX4R3vDlePBXlxL4pAlvVnsM2K74YJ3GPhm0E
 QtYFD7z/JLJp/zZqoETXuOo2NGsrYP8QS58CYlstIWt67hdO9SPWR8FIhgOT+gHMbyTG
 U4l8NrEwEVF4/I/sBPhq9tt+PJCgKfINZslcGqaK+RmRZmS99vcUlmfpN6D3Sfb8Da1c
 KNMjwkVkQcTDzrqAUA/9LlDJ4RUJKQqISEK9h0YV/98xMo3TEm7yfhfGOBC7/ke1S/WM
 2ysw==
X-Gm-Message-State: AOAM5303qTL/tGbsH66n+4CGOnhCu142lJX9vD4Crvn4JtLyymt3lsbN
 DJOAX0JKz8EQrvskpncX2EmgDCwF71Y=
X-Google-Smtp-Source: ABdhPJwXaq/F3AZbpjuABpAd/XW1dDwl54vap4eNP7dMLVrxSxpzbpGi8OFPo66L1ALkKjkFbNDc5Q==
X-Received: by 2002:a67:2702:: with SMTP id n2mr18562393vsn.42.1591133542689; 
 Tue, 02 Jun 2020 14:32:22 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com.
 [209.85.221.174])
 by smtp.gmail.com with ESMTPSA id x185sm9161vsb.15.2020.06.02.14.32.22
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 14:32:22 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id n22so1269989vkm.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Jun 2020 14:32:22 -0700 (PDT)
X-Received: by 2002:ac5:c305:: with SMTP id j5mr1333596vkk.92.1591133541729;
 Tue, 02 Jun 2020 14:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <1590751607-29676-1-git-send-email-sumit.garg@linaro.org>
 <1590751607-29676-3-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1590751607-29676-3-git-send-email-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Jun 2020 14:32:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XBVQnviPQJU-h46XQrGyz3PtTr-MsORS5W6EBh6n+9Dg@mail.gmail.com>
Message-ID: <CAD=FV=XBVQnviPQJU-h46XQrGyz3PtTr-MsORS5W6EBh6n+9Dg@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.68 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jgEWK-0037UT-LI
Subject: Re: [Kgdb-bugreport] [PATCH v4 2/4] kdb: Check status of console
 prior to invoking handlers
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
Cc: Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Fri, May 29, 2020 at 4:27 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Check if a console is enabled prior to invoking corresponding write
> handler.
>
> Suggested-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  kernel/debug/kdb/kdb_io.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
