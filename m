Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6455312D8F
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  8 Feb 2021 10:43:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l934l-0008Ea-ET
	for lists+kgdb-bugreport@lfdr.de; Mon, 08 Feb 2021 09:43:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1l934j-0008EO-9O
 for kgdb-bugreport@lists.sourceforge.net; Mon, 08 Feb 2021 09:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TFMxrL29RVpgXVjucIEhmDqKlJat5xJib/NlFFiNuQo=; b=QKn/3gEvBSas4Zz01cX3KAm5+S
 R7JwvVAaTfA8FlemJRxataOWGzG5CGnDONoLRsXNmSLoi/ozXun52Z6hEw/xP50OtS0yMI7CCBZv3
 ZG5E5qum9JVkXAkzINDSzu81OEGLhFNIUMt+0hK1xdAq0l64o/T5+7YUNmjqAU1XYOQo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TFMxrL29RVpgXVjucIEhmDqKlJat5xJib/NlFFiNuQo=; b=KW+Rbn9JdatIl084UHfhoINkW3
 nKUOiWNSaF+Da4DjT5zIKJEyhELDH/HRu56kNuuxDUx8u1O0olxtssOxXCGjjF9BPntel38PhXRY4
 uRu8HHO3Lt6+qRHsq97qbOJdKMCE2uU0ZS3ukeTmH/I0ksQBdj9b6VlDlsyijmcsNYek=;
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1l934a-00068Q-Kr
 for kgdb-bugreport@lists.sourceforge.net; Mon, 08 Feb 2021 09:43:21 +0000
Received: by mail-wm1-f52.google.com with SMTP id 190so11988428wmz.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 08 Feb 2021 01:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TFMxrL29RVpgXVjucIEhmDqKlJat5xJib/NlFFiNuQo=;
 b=UndgtQlDPAeKtPWb9bsNDWMRGnQrd1pAW/mMraMFTf4urQE7+5N9WeQo0fCwYR7i+d
 tZoR66RNIWLhQ8lyaIfVNcW5CTfOB8VboOH+CoFJS1/JnklSk/utEp1OsgF0z0KDhPig
 FLkVbUxS17sCoEt50/a+kIU7I1REze3wx3ug9MvtomhpwzwHyT3o3H6bupS5SuSzD3fP
 ZrkTyhC45v+8JvtMF19cuUeeAZhb7hBB72QIDQif9e1oZUyNWbwEG/sBDH455fNM1QL9
 YP4JEHulIe/9yx1w2K9kx1nYSShn792RSPZ/czA6TaOHjEO6k4VfaEXfhressHp8Qw5C
 TaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TFMxrL29RVpgXVjucIEhmDqKlJat5xJib/NlFFiNuQo=;
 b=a+0f1Qyi8OuVohYjmEu8SxcHS/aksyTrCOiPr9HsFTgNkXDT5JCdDVtsUENhLGTt9a
 Uu8zsFCrhVLYFppn1MlVaqBVOaOfuNzS5In2COhocXRRP1sHCFjaFVnTG851+4Vwr+wJ
 yEwf04JoLO3PU/zhT0ZtWHkefpOZ5n/O+p8MzinElzTtdV/TWFYHe5qcwE2GB2zIpuoc
 r+sUKOWQw38WEewu7gjt5kehFHa0MdJJmSyF+Gg72LViCU3zzxKZ5LpykVkDcPFWopzt
 gBuo21Ofr/TeIzw+0UR/WwCudJ7cRp4k6d9yB9w8qvr4eHLaDcDEu9mxUG719Fvh+Ezd
 bBUg==
X-Gm-Message-State: AOAM5316YEi3gn61DAxl25C3X79ac+WpsOtmVapZC+4NMlQyhY0x7Nyn
 QeSNlmmtZSj9z2Hw6FrQlFxTzw==
X-Google-Smtp-Source: ABdhPJyVam+DreGaG42pavUEMp3dftOST0JCXox76RWH5Agb1flkAmrodIgvcY1S0pzQHz/cRqXJlg==
X-Received: by 2002:a1c:1d8b:: with SMTP id
 d133mr13984489wmd.172.1612777386189; 
 Mon, 08 Feb 2021 01:43:06 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id s64sm21145060wms.21.2021.02.08.01.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 01:43:05 -0800 (PST)
Date: Mon, 8 Feb 2021 09:43:03 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20210208094303.csu2kkyi25d7a25y@maple.lan>
References: <1611915427-3196-1-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611915427-3196-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.52 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.52 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l934a-00068Q-Kr
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: Simplify kdb commands
 registration
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Jan 29, 2021 at 03:47:07PM +0530, Sumit Garg wrote:
> @@ -1011,25 +1005,17 @@ int kdb_parse(const char *cmdstr)
>  		++argv[0];
>  	}
>  
> -	for_each_kdbcmd(tp, i) {
> -		if (tp->cmd_name) {
> -			/*
> -			 * If this command is allowed to be abbreviated,
> -			 * check to see if this is it.
> -			 */
> -
> -			if (tp->cmd_minlen
> -			 && (strlen(argv[0]) <= tp->cmd_minlen)) {
> -				if (strncmp(argv[0],
> -					    tp->cmd_name,
> -					    tp->cmd_minlen) == 0) {
> -					break;
> -				}
> -			}
> -
> -			if (strcmp(argv[0], tp->cmd_name) == 0)
> +	list_for_each_entry(tp, &kdb_cmds_head, list_node) {
> +		/*
> +		 * If this command is allowed to be abbreviated,
> +		 * check to see if this is it.
> +		 */
> +		if (tp->cmd_minlen && (strlen(argv[0]) <= tp->cmd_minlen) &&
> +		    (strncmp(argv[0], tp->cmd_name, tp->cmd_minlen) == 0))
>  				break;

Looks like you forgot to unindent this line.

I will fix it up but... checkpatch would have found this.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
