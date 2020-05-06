Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 227241C78AB
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  6 May 2020 19:52:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jWODH-0003z6-To
	for lists+kgdb-bugreport@lfdr.de; Wed, 06 May 2020 17:52:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jWODG-0003ys-GA
 for kgdb-bugreport@lists.sourceforge.net; Wed, 06 May 2020 17:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5iG0pQNYOn7IOsAmtUw+ZTykNbeqpuJ4O2qEskHQyiE=; b=NPzKETLnICQZiKNUVAPMh8RMzA
 9yg3s0jc8orXOwhDtGOtOeAtPUsFTdXvCm6pJQfNd57bZhHSga0Gls/jwHQjkFJ8R2Vgmn0+eFPYn
 Eu8Pdrw91ZXquBP21ILN6DGSOj6wwv/mCJngm2iTGVJ1+qmJPmXoiY+NBbtFVChljdwA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5iG0pQNYOn7IOsAmtUw+ZTykNbeqpuJ4O2qEskHQyiE=; b=gCa9atgj+InrLAgH1eGwBG9GMQ
 +jGwEpcyNs38RNTaFZBzQKlft38zy1K51MC3roGq8oxhuAtk64i9sW+xrmWPe2urVE1H0xUMjlM9X
 7kBweqyaps990DIZEa7CmMy5AhtXHTAfFLgRpj058Xwppw675Cml4PmORFR80SJlD4wo=;
Received: from mail-pj1-f67.google.com ([209.85.216.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWODE-00GX0j-Jp
 for kgdb-bugreport@lists.sourceforge.net; Wed, 06 May 2020 17:52:06 +0000
Received: by mail-pj1-f67.google.com with SMTP id q24so1243701pjd.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 06 May 2020 10:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5iG0pQNYOn7IOsAmtUw+ZTykNbeqpuJ4O2qEskHQyiE=;
 b=NAziRFi3FyhOK/6H69GaH37L4/RdvD7mmx/g9XLM5gIG6M3oZgLtdCT5RL8SvH1YC0
 aiv/lHVe2QjjFv+Lt2U/D4qyIvsoY0Bd5rPENf80Knxsx2Z/S/GhAZIghmIj02HqjtOB
 eLH2+vecjnUJFKH1UvSXzYUkOWe6nG80yUrzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5iG0pQNYOn7IOsAmtUw+ZTykNbeqpuJ4O2qEskHQyiE=;
 b=HS+QzNPZwpYHXb/e1VxvbNJy9JSRZDv0AUT+apmtEWHnXiyNGNT0TdhZEata29GxUJ
 BAKsLSLTb0G8rm5sMn50moSf1deavLil04OQwGCMDy3lIdtOkc1/T/TSJIsflYBYObVE
 TM3rA++6oDh5Z3odV8Sp8QA6R7jy0ydHtveqU46Lr2s2RLonLe3FqDC7PmDiCAzEwRNW
 t8Pyx7xQUD0nBl1+4xpx3QRksPRuGO7+bakLoUO5FG/o/eLi9Yu2GCanKa2qJ0+QOPjU
 OZh/L4dBlz+vY05emYTDBxvrhpXJKRVRabsCP+I3vy+pHcoady6QU4g5ykJ++NxGYtyn
 pkMg==
X-Gm-Message-State: AGi0PuaxxnxavLlxdykbEBW69CFqjaTf8KK0AloiTJ3U6N4UbGkcSmYO
 o89jkorl22cAGpseSg9biSIIq+86G94=
X-Google-Smtp-Source: APiQypLV9S/Hce/PbwmI0bH4Tsf5Gc2FxxKbnCtpc2JShPxU3CMTMqOj6ENdDrIosi2V1QZFCPo9mA==
X-Received: by 2002:ac5:c4cd:: with SMTP id a13mr73897vkl.15.1588787064028;
 Wed, 06 May 2020 10:44:24 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41])
 by smtp.gmail.com with ESMTPSA id u142sm1377854vkb.8.2020.05.06.10.44.23
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2020 10:44:23 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id z16so821918uae.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 06 May 2020 10:44:23 -0700 (PDT)
X-Received: by 2002:ab0:559a:: with SMTP id v26mr8105444uaa.22.1588787062625; 
 Wed, 06 May 2020 10:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200506151727.2960-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200506151727.2960-1-andriy.shevchenko@linux.intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 May 2020 10:44:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vk58WL3op-ZKHVuByK_TNwuSi1MrLUrJ8DVcxgg0cpAw@mail.gmail.com>
Message-ID: <CAD=FV=Vk58WL3op-ZKHVuByK_TNwuSi1MrLUrJ8DVcxgg0cpAw@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.67 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWODE-00GX0j-Jp
Subject: Re: [Kgdb-bugreport] [PATCH v1] kgdb: Drop malformed kernel doc
 comment
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Wed, May 6, 2020 at 8:17 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Kernel doc does not understand POD variables to be referred to.
>
> .../debug_core.c:73: warning: cannot understand function prototype:
> 'int                             kgdb_connected; '
>
> Convert kernel doc to pure comment.
>
> Fixes: dc7d55270521 ("kgdb: core")
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  kernel/debug/debug_core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Seems fine to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
