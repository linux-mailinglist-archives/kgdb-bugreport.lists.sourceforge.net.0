Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 201738AD6B7
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Apr 2024 23:39:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rz1OD-0006Bm-Gy
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 22 Apr 2024 21:39:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <justinstitt@google.com>) id 1rz1OA-0006Be-Qt
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 21:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BEYoYZ4ojQsxz1tZuFjfEBTZaCuwMjE7Y0TzNKxEghA=; b=UGzkpFPElUdHrkyO/QdW4i7iyf
 VH610PqosRryzx/r0s2d2AORopYofF2Np8HYuFzIZ8ai4Os6FDxi5Cyn/Iai61UyQZSdbdgCOcwaf
 kgItSSbAih2cNiiHrWaDCwDtYCRm0H7/L8I5zcVd/nzeOfAJbILAdWXcyA2qOTcup5JM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BEYoYZ4ojQsxz1tZuFjfEBTZaCuwMjE7Y0TzNKxEghA=; b=JTow0l4DfP2vRQdlQFBQh/skge
 V/u+apmDpY4VOQz1TRM4rgzGTpQomSk+JxioP339XyFqHxJADcjSCJGwq76hmpyKqv5VcK/dLYUaM
 IgY485GZ5UHjQLjM8GJduUXojRMQCmceKouVRDj0ycWWvDJ3Fz9p7//dvfTxSD/A56V0=;
Received: from mail-il1-f181.google.com ([209.85.166.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rz1OA-0003hH-1M for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 21:39:51 +0000
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-36b21e8c6ccso20725025ab.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 14:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1713821980; x=1714426780;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BEYoYZ4ojQsxz1tZuFjfEBTZaCuwMjE7Y0TzNKxEghA=;
 b=RWHMh3nEEnkkD+MLNG4C9DQaXxlobuSa8vvPn0srTuDFI+625EN7YPOXPi1l/P+cOk
 mI/rhWdB5+D64kIdVtIXaefhbwOTt17/w96n6KvgxTo3ka9/xnGiuUi4PO2TQUx0kQgY
 qCGwxSd0FfLIG5ixAn7kzRV1GYJXZGBGJcVT/BdOSqKn7SFln4jeRzBsOWjRz4gMAxG5
 kAfZts6c7OT4Dypy/OPukOktjqD79TWm+9vIMbpP40zZ+Cz2vKPyB6SXmeWOjQUTYgiu
 mbfn9nm5rjUzgq65lnzXhxp6uhpHBN8amucA2QYd7ex12psEkAGZsCo5A2nATazY0eMd
 h/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713821980; x=1714426780;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BEYoYZ4ojQsxz1tZuFjfEBTZaCuwMjE7Y0TzNKxEghA=;
 b=o701X07B6ycYW2K1OBGVZHx5Rpp6WcGuNhw+xSMgcnEhH76t0Yufh5fQwBh39N7+yn
 sgyfV3EbxdWXnpzXTVPDIG1R2mzcMncPUcGk9E/ncwwx587L9Ue3tq/Op1nMF6VwwuX9
 rUQ5H+ccBlJBdWTpOZL5DFbE/d6dbAjS4VJNntQS43WxnJ61Kikq2Qu3P3qP3dX6kYgE
 i7UiFWXryEl4MfzmAUoTmp27Hi4EUMgBwUO3J+k/O5g0uX7A8Z3RI+e3zUGdqJWi0STE
 fxc7hPlqTxvxtWV2kwkThoSmT/5PKJXQC8vap39KI/ZGMdqTGAuGk+OggU1T4cYndLp2
 Zvjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh6IdSRhoCMPSSn+Ha2CdL2tZ9wGtZ+l+/iSEMW60DVLgo4Am93+xrPrDIv3x2C1jsJgeJ5wR3sVfF4kTpzATpKmQAc9lxNtZrAt8H574hTx5mjYY=
X-Gm-Message-State: AOJu0YyIyF3RFo3n4UCK/i/RHQXaTsO0SMACBx7Gl0qJuKxo57BbmXkg
 W1HCDIA+4i4deHQLlPA+MzEFyAjw6KubUFx7YKmhsmRmJ6zmNeAZG35EIP3+9g==
X-Google-Smtp-Source: AGHT+IH4fX/ZDpdX4q2CepXFgoagZzam0TlmHHrE8pLQ1KlDc3g+s75zHppnlpujcosjpbFrowmbCQ==
X-Received: by 2002:a05:6e02:20c8:b0:36a:3f20:8cb with SMTP id
 8-20020a056e0220c800b0036a3f2008cbmr16186840ilq.18.1713821979828; 
 Mon, 22 Apr 2024 14:39:39 -0700 (PDT)
Received: from google.com (195.121.66.34.bc.googleusercontent.com.
 [34.66.121.195]) by smtp.gmail.com with ESMTPSA id
 e99-20020a02866c000000b004830fd34ce6sm3135897jai.74.2024.04.22.14.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 14:39:39 -0700 (PDT)
Date: Mon, 22 Apr 2024 21:39:34 +0000
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <kyvcojgj2hgkxrv6a56dyfpxarc4cdcsb3kscchytlfx52ggfu@nx64h62xmqv7>
References: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
 <20240422-kgdb_read_refactor-v2-1-ed51f7d145fe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240422-kgdb_read_refactor-v2-1-ed51f7d145fe@linaro.org>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Mon, Apr 22, 2024 at 05:35:54PM +0100, Daniel Thompson
 wrote: > Currently, when the user attempts symbol completion with the Tab
 key, kdb > will use strncpy() to insert the completed symbol into th [...]
 Content analysis details:   (-15.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.166.181 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 welcome-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.181 listed in wl.mailspike.net]
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1rz1OA-0003hH-1M
Subject: Re: [Kgdb-bugreport] [PATCH v2 1/7] kdb: Fix buffer overflow during
 tab-complete
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
From: Justin Stitt via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Justin Stitt <justinstitt@google.com>
Cc: kgdb-bugreport@lists.sourceforge.net, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, Apr 22, 2024 at 05:35:54PM +0100, Daniel Thompson wrote:
> Currently, when the user attempts symbol completion with the Tab key, kdb
> will use strncpy() to insert the completed symbol into the command buffer.
> Unfortunately it passes the size of the source buffer rather than the
> destination to strncpy() with predictably horrible results. Most obviously
> if the command buffer is already full but cp, the cursor position, is in
> the middle of the buffer, then we will write past the end of the supplied
> buffer.
> 
> Fix this by replacing the dubious strncpy() calls with memmove()/memcpy()
> calls plus explicit boundary checks to make sure we have enough space
> before we start moving characters around.
> 
> Reported-by: Justin Stitt <justinstitt@google.com>
> Closes: https://lore.kernel.org/all/CAFhGd8qESuuifuHsNjFPR-Va3P80bxrw+LqvC8deA8GziUJLpw@mail.gmail.com/
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>

Nice! This is better than the conversions I tried to make earlier.

Your patch helps with https://github.com/KSPP/linux/issues/90

Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  kernel/debug/kdb/kdb_io.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 9443bc63c5a24..06dfbccb10336 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -367,14 +367,19 @@ static char *kdb_read(char *buffer, size_t bufsize)
>  			kdb_printf(kdb_prompt_str);
>  			kdb_printf("%s", buffer);
>  		} else if (tab != 2 && count > 0) {
> -			len_tmp = strlen(p_tmp);
> -			strncpy(p_tmp+len_tmp, cp, lastchar-cp+1);
> -			len_tmp = strlen(p_tmp);
> -			strncpy(cp, p_tmp+len, len_tmp-len + 1);
> -			len = len_tmp - len;
> -			kdb_printf("%s", cp);
> -			cp += len;
> -			lastchar += len;
> +			/* How many new characters do we want from tmpbuffer? */
> +			len_tmp = strlen(p_tmp) - len;
> +			if (lastchar + len_tmp >= bufend)
> +				len_tmp = bufend - lastchar;
> +
> +			if (len_tmp) {
> +				/* + 1 ensures the '\0' is memmove'd */
> +				memmove(cp+len_tmp, cp, (lastchar-cp) + 1);
> +				memcpy(cp, p_tmp+len, len_tmp);
> +				kdb_printf("%s", cp);
> +				cp += len_tmp;
> +				lastchar += len_tmp;
> +			}
>  		}
>  		kdb_nextline = 1; /* reset output line number */
>  		break;
> 
> -- 
> 2.43.0
> 
>

Thanks
Justin


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
