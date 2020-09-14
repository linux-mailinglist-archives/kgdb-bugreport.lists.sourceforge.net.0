Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E28FF269989
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 15 Sep 2020 01:14:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kHxg2-0003fA-Nc
	for lists+kgdb-bugreport@lfdr.de; Mon, 14 Sep 2020 23:14:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1kHxg1-0003ey-Bp
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Sep 2020 23:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=di2Va6QiS0ibtKbu5o8+rvmL8yOxtQOTJvAeGXIj49A=; b=cBEekt/5YKN5i5pnWkjzbuQUM9
 9JW/g726/qWCx/wnStCre6zV+UAHt/0F5dl5PF6+nLbxScqnK4MnmJW+v5LCn54otR0DbNBHl+SDP
 b3xb3A2zu0pg2Cf3VI1ua5dl2vQX2XBfd0n8rZlBFCyI7OY86iC5JB+HGOKZTj8PBmb8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=di2Va6QiS0ibtKbu5o8+rvmL8yOxtQOTJvAeGXIj49A=; b=k2c0ZAQeu3yCuvLYXZleLUpNY7
 7k9oRzyJdURKgcpR0/lTY/I5Rl5lIND0T3N+gWrL3do/1fu7cMoCurbK6TZz5/G4PXcfJC5qCwfEo
 NQdyFviCg71hEqLpxRhKU6aJdNI+vx+koWlzdl/OQKKtZRA3MnzQreFSXfgDs8gyAssY=;
Received: from mail-vk1-f194.google.com ([209.85.221.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kHxfy-009szj-CK
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Sep 2020 23:14:25 +0000
Received: by mail-vk1-f194.google.com with SMTP id s127so375269vkg.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 14 Sep 2020 16:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=di2Va6QiS0ibtKbu5o8+rvmL8yOxtQOTJvAeGXIj49A=;
 b=DIwwhM/aJ2/PXaNDwnC/Yt+HFlzhdpcLFKwKxZ/QSEH/2qfSfXNpHg292gjgaxV3G6
 18NtSkXh2GpKANCtwpIaeCYueZ6/lPrCqp1JAOiel9y0wygzuGlgXA+9fvrX2raPaYp+
 5yDY71OQi41U8VwFHpGqHi+uQdJvXsxDlhFZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=di2Va6QiS0ibtKbu5o8+rvmL8yOxtQOTJvAeGXIj49A=;
 b=YSe0LLs49yr0n0OT9DLJcvpUqmjEEhF3vqslxyA+5eHdK335TRWfVjDGwlDWYR5Veo
 wwwqzbCXdB+Wuna4kTmXVOgezm7pykS1prlA078XPSnr+wuLYZ4p9zt67WdN+lXVUIGp
 3VySd/InYqUPnnHtBbF0nbEyxGS3IuLePONf6yzC5quHIJLxTICHKe86Jwv1dLBXeHlf
 +RbBvMJ2sSIeGUWmC+Fqnt4ime2nDPiYgGxhCd/QWpv6akejS7DQudmmGKLixvEfD9PL
 /wjAt4B15ny9BeCq74XR2poRYyFkxTihVWFIJkjdEykQn7jKVMtPZgje+xcSVhpY494l
 6EDg==
X-Gm-Message-State: AOAM5330liStAmMXjfQFgKeSTVk+OT63IDlxvJ0WvXu/bIQWFb8lGKyy
 jbkiF3mbiKo8A4XmDMMRaJGIwR2gtyTacQ==
X-Google-Smtp-Source: ABdhPJxbVR7gjqVfqWVOQJuqtxAdC8LnJ4P91u5ocPWps2mTdMRS1CqofW2MYBaHHipNXFjoQ0xUJA==
X-Received: by 2002:a1f:198b:: with SMTP id 133mr8328051vkz.28.1600125249257; 
 Mon, 14 Sep 2020 16:14:09 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com.
 [209.85.221.172])
 by smtp.gmail.com with ESMTPSA id w201sm2045438vke.47.2020.09.14.16.14.08
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 16:14:08 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id c25so378911vkm.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 14 Sep 2020 16:14:08 -0700 (PDT)
X-Received: by 2002:a1f:26cd:: with SMTP id m196mr8715666vkm.7.1600125248289; 
 Mon, 14 Sep 2020 16:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200909141708.338273-1-daniel.thompson@linaro.org>
In-Reply-To: <20200909141708.338273-1-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Sep 2020 16:13:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WqDpBj5YeQ6G+QeBbxwNDsn7HMAZJA297ATc26FTA_=A@mail.gmail.com>
Message-ID: <CAD=FV=WqDpBj5YeQ6G+QeBbxwNDsn7HMAZJA297ATc26FTA_=A@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.194 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kHxfy-009szj-CK
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Fix pager search for multi-line
 strings
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
Cc: kgdb-bugreport@lists.sourceforge.net, Patch Tracking <patches@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Wed, Sep 9, 2020 at 7:18 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Currently using forward search doesn't handle multi-line strings correctly.
> The search routine replaces line breaks with \0 during the search and, for
> regular searches ("help | grep Common\n"), there is code after the line
> has been discarded or printed to replace the break character.
>
> However during a pager search ("help\n" followed by "/Common\n") when the
> string is matched we will immediately return to normal output and the code
> that should restore the \n becomes unreachable. Fix this by restoring the
> replaced character when we disable the search mode and update the comment
> acordingly.
>
> Fixes: fb6daa7520f9d ("kdb: Provide forward search at more prompt")
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>
> Notes:
>     In the long term the kdb pager code would probably benefit from a
>     bigger rewrite since the way it handles newlines is still quirky
>     and confusing. However this fix is easy to backport so I decided
>     not to hold it back whilst we wait for code that is not yet
>     written.
>
>  kernel/debug/kdb/kdb_io.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Wow, more kdb functionality that I never knew anything about!  Seems
like a reasonable fix to me even if I agree that the code could use a
bigger cleanup.

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
