Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E6A17374
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  8 May 2019 10:16:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hOHl2-0004Rk-FK
	for lists+kgdb-bugreport@lfdr.de; Wed, 08 May 2019 08:16:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1hOHky-0004Qm-ME
 for kgdb-bugreport@lists.sourceforge.net; Wed, 08 May 2019 08:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GAXYVm9NcX/2LS+PAeOz79lHGPmC519ptueWLbeJo8k=; b=U/dFEezCmJntnq0zCDWIhacZ0E
 9b0zjMwLO8WbD6MeEz34voSnlBZaZY4Kmi+us89AUSFfJjmqoKewK2ys3a5tbRx33GXUcGnNQA+Nm
 ju+dVGheQpROfpG6W2g4mCZ44zwoHxyirCn9G60Zrg/DsFqlOdA5YRv9OibcjM0J10s4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GAXYVm9NcX/2LS+PAeOz79lHGPmC519ptueWLbeJo8k=; b=FS06bflnHnIuctWt6c7KJ6SJro
 lL7efTXWlACkSIgK/njVbGx1LxFlfUXuSKAp7LLXIhoRmwvyZ0KaNO03UOIDIRvr6q1ElAx47vWCq
 Lo4lPt+2/Nu86djJDd+SCBCVilplCK1IgdUeE8xZ4xIhiEs7TJJmjpALtA2Ef/kWaFjQ=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hOHkv-009d1z-TE
 for kgdb-bugreport@lists.sourceforge.net; Wed, 08 May 2019 08:16:52 +0000
Received: by mail-wr1-f68.google.com with SMTP id s15so25907643wra.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 08 May 2019 01:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GAXYVm9NcX/2LS+PAeOz79lHGPmC519ptueWLbeJo8k=;
 b=oXeyXO6C0pw6WvX5xZqKPgGsXKCY0G9zfoXSWEV79JmfIgrUqcvThF3c1YIifzZWLG
 kx1W7KwZYeRCMKXKrM0K09z2V3abI581w9sZsEWhfIe14Bn9LTQT+MbvqpYNctqZQQ8n
 mlTc+hcrWbSh7g5ECWlxDYTcM2tbaELh7qwtazUS4EW+WxxyVL65gaLOVogQ+75hxVtp
 jQql/ObUJjEsKllPLxEwhc6R+s41C43RWWcjxDKsu6x8zZJd1pVmbddxfNCPF0/wbSyG
 dSYgZyROGY5LAcxiJLbpVoF5AHTWJiBXzrcdlr5NUki/Et8NFNKpSW9opSp1vcUWp1sO
 hlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GAXYVm9NcX/2LS+PAeOz79lHGPmC519ptueWLbeJo8k=;
 b=gz20tXTHvbmBIKN45TAx2kxbSRSDkx5KXGWw8nKLhMjHJCXvrSA14E1V+/Bzyuusvm
 iTth8PVPdfzN233FVufb5Tac7dWZ9WXt+Y7OeQkQzMsak5sdNnQdgghtKw6RBf7kZmtG
 gv0EcOt1b/Mn25tEEAXAkCu0PFUgB1/RJTexEGhkZd3xc4muVvzVgxICmSXIYyQUpjCe
 ijg2J/xNK0yyj00gx0FyQzqZMcNtorb9dr66D7GL2a8dIHH4yS71pO7vlmHN1JbR8Dvy
 gGxZ2slKx7Z+uwjhWBaEvmIqDFK4YTEitxOTd0A9Yl/NjvRxUOdmE+O2bHQINaMnD6TI
 fnuA==
X-Gm-Message-State: APjAAAW4lW33QDCvkt4thA4dTgCvb6ZM/cUKeOH8yswowpOxuEIs3lVT
 Hy0XWF+ybA3fpfNV8agXE3Cw+A==
X-Google-Smtp-Source: APXvYqyG1HAsV02i0U4ENltrjiHr5I37VaEzMpOv2ZB+S/cXkDHWabqASHuRwZ0rv35Yf2my3nSLlw==
X-Received: by 2002:a5d:4f88:: with SMTP id d8mr10862408wru.34.1557303403211; 
 Wed, 08 May 2019 01:16:43 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id m17sm3556067wmi.27.2019.05.08.01.16.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 01:16:42 -0700 (PDT)
Date: Wed, 8 May 2019 09:16:40 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Wenlin Kang <wenlin.kang@windriver.com>
Message-ID: <20190508081640.tvtnazr4tf5jijh7@holly.lan>
References: <1557280359-202637-1-git-send-email-wenlin.kang@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557280359-202637-1-git-send-email-wenlin.kang@windriver.com>
User-Agent: NeoMutt/20180716
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: windriver.com]
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hOHkv-009d1z-TE
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Fix bound check compiler warning
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
Cc: prarit@redhat.com, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, May 08, 2019 at 09:52:39AM +0800, Wenlin Kang wrote:
> The strncpy() function may leave the destination string buffer
> unterminated, better use strlcpy() instead.
> 
> This fixes the following warning with gcc 8.2:
> 
> kernel/debug/kdb/kdb_io.c: In function 'kdb_getstr':
> kernel/debug/kdb/kdb_io.c:449:3: warning: 'strncpy' specified bound 256 equals destination size [-Wstringop-truncation]
>    strncpy(kdb_prompt_str, prompt, CMD_BUFLEN);
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> ---
>  kernel/debug/kdb/kdb_io.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 6a4b414..7fd4513 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -446,7 +446,7 @@ static char *kdb_read(char *buffer, size_t bufsize)
>  char *kdb_getstr(char *buffer, size_t bufsize, const char *prompt)
>  {
>  	if (prompt && kdb_prompt_str != prompt)
> -		strncpy(kdb_prompt_str, prompt, CMD_BUFLEN);
> +		strlcpy(kdb_prompt_str, prompt, CMD_BUFLEN);

Shouldn't that be strscpy?


Daniel.

>  	kdb_printf(kdb_prompt_str);
>  	kdb_nextline = 1;	/* Prompt and input resets line number */
>  	return kdb_read(buffer, bufsize);
> -- 
> 1.9.1
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
