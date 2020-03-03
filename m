Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B28CB178452
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  3 Mar 2020 21:51:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1j9EVr-0000qr-7d
	for lists+kgdb-bugreport@lfdr.de; Tue, 03 Mar 2020 20:51:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1j9EVp-0000qj-TP
 for kgdb-bugreport@lists.sourceforge.net; Tue, 03 Mar 2020 20:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oW1Q93Cz5/1oipunUTCgm+h+ggYdq5iJCZAefRCHPRY=; b=ZARW+Iou8SQE+xX92YReqDMLul
 +Z+cI5a1sNUEO8QDVee1aBHRVECrcxVUwVIphK/sDEaYEAtALaPGRHoXOQpRiC+g1gdzFepxa1JpC
 XdKc+recBuB6gGuX1eWI6pq0/kajfpBnhlgJ+UiXJ+MUYZA/G6vYuj95lb5qZHrpw7Pk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oW1Q93Cz5/1oipunUTCgm+h+ggYdq5iJCZAefRCHPRY=; b=kxFYopIW8lQlb69lqaKPp4suHH
 WqOTf7NGuX3AZPm9qg1niK3th0G7zFn+zrEggUbv299TEI3L2iLuHux+I4Wmrsc56f/UPYF68LxGY
 Rj4sqvMHaHIHQbGzVsIK097W0VeCm3YTe3OgvUEPa41g+1NKsJXXPT6g2fKUkJa7T7DI=;
Received: from mail-ua1-f66.google.com ([209.85.222.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1j9EVn-0066Gg-Qw
 for kgdb-bugreport@lists.sourceforge.net; Tue, 03 Mar 2020 20:51:33 +0000
Received: by mail-ua1-f66.google.com with SMTP id y3so1693548uaq.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 03 Mar 2020 12:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oW1Q93Cz5/1oipunUTCgm+h+ggYdq5iJCZAefRCHPRY=;
 b=iEomnEKBhquBub86A4qsjvpPTMpdF9h11IVjF8WbZPa8oljG9R8502kvXGsji0Vhky
 poyBNMxKdhRoIxueWBrNGTes7A3w0xZ6kvL5XbAu/VIgLoio6OjFamH7jOBSUQRuJzfc
 W/2ygkiIEse9DzXFAlP9QSTi9Dzrc2xGd1FbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oW1Q93Cz5/1oipunUTCgm+h+ggYdq5iJCZAefRCHPRY=;
 b=S9c3qoghcouXpqkK7Zzzy40J1lFFT5jW1y9gfPFhCjiT6Wa1OhkegNFo0mST+q8H5L
 8VHo/tPjHpP8lQhIEvJYGSI+XMX9e+7FZ8S1xWZVbHBYWJVBNp9Q0eMX3oEbWVoYnibZ
 wIs7qGy9MpG+yF7EAszYScCX+pcDEB/JoWWrQ7ItwvcXwNYvZqiiqZMYMKmWasx7oHvL
 OaNb1N0izB08IOnxkZgjTrFCcx4ehVOp+hbxTNNDA62se4U0NM2Y938iiPES3Y4fnTsO
 hIgR87vnYikmUEJoHaSMLU7TsJQvYg0fpDWnfsWByK1AfuQSDtRtlcNGAaTp9fL9h449
 Q7hw==
X-Gm-Message-State: ANhLgQ22zmlaEQszMQF0/SzBcFlE+l7PdUhOZxD/pBVLal4hAG4YmWmQ
 Zbuhn2KwLhoapkNjCWHdSSp3hZd7czw=
X-Google-Smtp-Source: ADFU+vtRn0CISeY5ekjmc4xa7uCr/F3frRs78HyQPqR+3ewjb3ISEDBiRJpXl1/anfg1A5OBgsZVKQ==
X-Received: by 2002:ab0:65c7:: with SMTP id n7mr3859877uaq.45.1583268682291;
 Tue, 03 Mar 2020 12:51:22 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49])
 by smtp.gmail.com with ESMTPSA id y14sm5396671uac.10.2020.03.03.12.51.20
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 12:51:21 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id w142so3348175vsw.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 03 Mar 2020 12:51:20 -0800 (PST)
X-Received: by 2002:a67:e342:: with SMTP id s2mr3570808vsm.198.1583268680084; 
 Tue, 03 Mar 2020 12:51:20 -0800 (PST)
MIME-Version: 1.0
References: <20200213164146.366251-1-daniel.thompson@linaro.org>
In-Reply-To: <20200213164146.366251-1-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 3 Mar 2020 12:51:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UM6eePrTE9Kpc4zfTSBpQSYXJghVP9dGAvD_25=JTfzw@mail.gmail.com>
Message-ID: <CAD=FV=UM6eePrTE9Kpc4zfTSBpQSYXJghVP9dGAvD_25=JTfzw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.66 listed in list.dnswl.org]
 -1.5 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1j9EVn-0066Gg-Qw
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Censor attempts to set PROMPT
 without ENABLE_MEM_READ
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Wang Xiayang <xywang.sjtu@sjtu.edu.cn>, Patch Tracking <patches@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, Feb 13, 2020 at 8:42 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Currently the PROMPT variable could be abused to provoke the printf()
> machinery to read outside the current stack frame. Normally this
> doesn't matter becaues md is already a much better tool for reading
> from memory.
>
> However the md command can be disabled by not setting KDB_ENABLE_MEM_READ.
> Let's also prevent PROMPT from being modified in these circumstances.
>
> Whilst adding a comment to help future code reviewers we also remove
> the #ifdef where PROMPT in consumed. There is no problem passing an
> unused (0) to snprintf when !CONFIG_SMP.
> argument
>
> Reported-by: Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  kernel/debug/kdb/kdb_main.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

I can't say I'm an expert on the kdb permissions model since I wasn't
really even aware of it before reading this patch, but your change
seems reasonable to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
